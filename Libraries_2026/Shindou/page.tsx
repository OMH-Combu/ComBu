"use client"; 
 
import React, { useState, useEffect, useRef } from 'react'; 
import { 
  XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, AreaChart, Area, Line 
} from 'recharts'; 
 
// --- 型定義 --- 
interface LifeEvent {
  id: string; 
  age: number; 
  cost: number; 
  label: string; 
  isAchieved: boolean; 
} 
 
interface HistoryLog { 
  date: string; 
  message: string; 
  type: 'event' | 'crash' | 'achievement' | 'rebalance'; 
} 
 
// --- 定数・初期設定 --- 
const INITIAL_AGE = 18; 
const MAX_AGE = 85; 
const INITIAL_EXCHANGE_RATE = 150; 
const COLORS = { 
  cash: '#98fb98', 
  stock: '#ffb6c1', 
  index: '#eec137', 
  bond: '#add8e6', 
  border: '#eeeeee', 
  pureCash: '#000080' 
}; 

const InvestmentSimulator: React.FC = () => { 
  // --- 状態管理 (表示用) --- 
  const [age, setAge] = useState(INITIAL_AGE); 
  const [month, setMonth] = useState(1); 
  const [isRunning, setIsRunning] = useState(false); 
  const [assets, setAssets] = useState({ cash: 300, stock: 0, index: 0, bond: 0 }); 
  const [exchangeRate, setExchangeRate] = useState(INITIAL_EXCHANGE_RATE); 
  const [monthlyContribution, setMonthlyContribution] = useState({ type: 'index', amount: 0 }); 
  const [lifeEvents, setLifeEvents] = useState<LifeEvent[]>([]); 
  const [history, setHistory] = useState<HistoryLog[]>([]); 
  const [telop, setTelop] = useState(""); 
  const [score, setScore] = useState(0); 
  const [chartData, setChartData] = useState<any[]>([]); 
 
  // --- 体験型チュートリアル用 --- 
  const [isAdvTutorial, setIsAdvTutorial] = useState(false); 
  const [advStep, setAdvStep] = useState(0); 
  const [isWaitingForAutoRun, setIsWaitingForAutoRun] = useState(false); 
   
  // 倍率を管理するステート（初期値は1倍） 
  const [speedMultiplier, setSpeedMultiplier] = useState(1);
 
  // --- ヘルプ画面の状態管理 --- 
  const [isHelpOpen, setIsHelpOpen] = useState(false); 
  const [helpPage, setHelpPage] = useState<'menu' | 'detail'>('menu'); 
  const [selectedHelpTitle, setSelectedHelpTitle] = useState(""); 
 
  const [isEventListOpen, setIsEventListOpen] = useState(false); 
 
  const updateEventAge = (id: string, newAge: number) => { 
    setLifeEvents(prev => prev.map(e =>  
      e.id === id ? { ...e, age: newAge } : e 
    )); 
  }; 
   
  // --- 1変更 --- 
 {helpContent["ツールの基本的な流れ"].map((text, index) => (
    <React.Fragment key={index}>
      <p>{text}</p>
      {/* 「高スコア」という文字が含まれる行の後に画像を表示 */}
      {text.includes("高スコアを目指しましょう！") && (
        <div style={{ textAlign: 'center', margin: '10px 0' }}>
          <img 
            src="/srank.png" 
            alt="スコア獲得" 
            style={{ width: '100%', maxWidth: '250px', borderRadius: '5px' }} 
          />
        </div>
      )}
     </React.Fragment>
  ))}
    "個別株とは？": [ 
      "・特定の企業の株を買う投資方法です。", 
      "・リスクは高いですが、大きなリターンや配当が期待できる場合があります。", 
      "・現実ではハイリスクローリターンの個別株も多いので気をつけましょう" 
    ], 
    "インデックスとは？": [ 
      "・市場全体の動きに連動することを目指す投資手法です。", 
      "・分散投資ができるため、比較的リスクを抑えつつ成長を狙えます。", 
      "・ただ、暴落のリスクは普通にあります。", 
      "暴落リスクさえ理解していれば最もおすすめできる投資方法です！", 
      "　　　　　　　使い倒しましょう！" 
    ], 
    "債券とは？": [ 
      "・国や企業にお金を貸し、利息を受け取る仕組みです。", 
      "・一般的に株よりも値動きが穏やかで、守りの資産とされます。", 
      "・ちなみに今回は国内の利回りが低すぎるので米国債券としています。" 
    ], 
    "現金の使い方": [ 
      "・暴落時の買い増し資金や、急なライフイベントへの備えとして重要です。", 
      "・投資に回さない「生活防衛資金」は現金で持っておきましょう。" 
    ], 
    "ツールのみかた": [ 
      "・右上の数字が現在の総資産です。バーの色で資産の内訳がわかります。", 
      "・赤い丸はあなたの現在の年齢を表しています。" 
    ] 
  }; 
 
  // --- 内部計算用の参照 (Ref) --- 
 
  const assetRef = useRef({ cash: 300, stock: 0, index: 0, bond: 0 }); 
  const pureCashRef = useRef(0.03); 
  const crashState = useRef({ isCrashing: false, recoveryMonths: 0 }); 
  const exchangeRateRef = useRef(INITIAL_EXCHANGE_RATE); 
 
  const ASSET_NAME_MAP: { [key: string]: string } = { 
    '現金': 'cash', 'げんきん': 'cash', 'cash': 'cash', 
    '個別株': 'stock', 'こべつかぶ': 'stock', 'stock': 'stock', 
    'インデックス': 'index', 'いんでっくす': 'index', 'index': 'index', 
    '債券': 'bond', 'さいけん': 'bond', 'bond': 'bond' 
  }; 
 
  const [isTutorialOpen, setIsTutorialOpen] = useState(false); 
  const [tutorialStep, setTutorialStep] = useState(0); 
 
  const tutorialMessages = [ 
    "こんにちは！", 
    "投資シミュレーションツールで投資を疑似体験してみましょう！", 
    "投資をする、といってもまずは目標を決めないと何をすればいいかわからないですよね。", 
    "まずは「ライフイベント」ボタンでライフイベントを決めてみましょう！", 
    "難しく考える必要はありません！", 
    "車が欲しい（300万円）など、自由に内容を決めて、たくさん作りましょう！", 
    "次にすることは「積立設定」ですね", 
    "できるだけ現実を意識して積み立てましょう！", 
    "積立先は「個別株」「インデックス」「債券」「現金」から選べます", 
    "それぞれの特徴は「」ボタンから確認できます", 
    "特徴をよく知ってから選んでみましょう！", 
    "ちなみに、「ライフイベント」や「積立設定」を決めなくても実行はできますが、現金の価格はあがらないので何も起こりません…", 
    "最初にその2つを決めておくのをおすすめします！", 
    "以上でチュートリアルを終わります", 
    "ぜひ遊びながら投資を楽しんでいってくださいね！" 
  ]; 
 
  // ライフイベント追加の行~135 
  // 35行目〜50行目あたりにある useState の並びに追加してください 
  const [isEventConfirming, setIsEventConfirming] = useState<LifeEvent | null>(null); 
  const [pendingPayment, setPendingPayment] = useState<{ event: LifeEvent, remaining: number, paidDetails: { [key: string]: number } } | null>(null); 
 
  // 累計の支払い記録（称号判定用：{ cash: 500万, index: 1000万 ... }） 
  const [totalPaidStats, setTotalPaidStats] = useState({ cash: 0, stock: 0, index: 0, bond: 0 }); 
 
  const startPaymentFlow = (event: LifeEvent) => { 
    let remaining = event.cost; 
    const currentAssets = { ...assetRef.current }; 
    const paidThisTime = { cash: 0, stock: 0, index: 0, bond: 0 }; 
 
    while (remaining > 0) { 
      const inputAsset = prompt( 
        `【${event.label}】残り ¥${remaining.toLocaleString()} の支払いが必要です。\n支払う資産を選択してください (現金, 個別株, インデックス, 債券)`,  
        "現金" 
      ); 
      if (!inputAsset) { 
        alert("支払いを中断できません。資産を選択してください。"); 
        continue; 
      } 
 
      const assetKey = ASSET_NAME_MAP[inputAsset] as keyof typeof currentAssets; 
      if (!assetKey) { 
        alert("正しい資産名を入力してください。"); 
        continue; 
      } 
 
      const available = currentAssets[assetKey]; 
      if (available <= 0) { 
        alert(`${inputAsset}の残高がありません。`); 
        continue; 
      } 
 
      const inputAmt = Number(prompt( 
        `${inputAsset}の残高: ¥${Math.floor(available).toLocaleString()}\nいくら出しますか？（万単位）`,  
        Math.min(remaining / 10000, available / 10000).toString() 
      )); 
 
      const amount = inputAmt * 10000; 
      if (isNaN(amount) || amount <= 0) { 
        alert("正数で入力してください。"); 
        continue; 
      } 
 
      const finalPay = Math.min(amount, available, remaining); 
     
      // 資産を減らす 
      currentAssets[assetKey] -= finalPay; 
      paidThisTime[assetKey as keyof typeof paidThisTime] += finalPay; 
      remaining -= finalPay; 
    } 
 
    // 全額払い終えた後の処理 
    assetRef.current = currentAssets; 
    setAssets(currentAssets); 
     
    // 累計統計に加算 
    setTotalPaidStats(prev => ({ 
      cash: prev.cash + paidThisTime.cash, 
      stock: prev.stock + paidThisTime.stock, 
      index: prev.index + paidThisTime.index, 
      bond: prev.bond + paidThisTime.bond 
    })); 
 
    // 比較用資産からもイベント費用を差し引く 
    pureCashRef.current -= event.cost; 
 
    // スコア加算 
    const basePoints = event.cost / 100000; 
    const points = event.cost >= 10000000  
      ? Math.floor(basePoints * 1.5) 
      : Math.floor(basePoints); 
     
    setScore(s => s + points); 
     
    // 履歴と通知 
    setLifeEvents(prev => prev.map(e => e.id === event.id ? { ...e, isAchieved: true } : e)); 
    setHistory(h => [{ date: `${age}歳${month}月`, message: `イベント完遂: ${event.label}`, type: 'achievement' }, ...h]); 
    setTelop(`${event.label}の支払いが完了！スコア+${points}`); 
    // 次に控えている「未達成かつ今の年齢以下のイベント」を探す 
    const nextEvent = lifeEvents.find(e =>  
      e.id !== event.id && !e.isAchieved && e.age <= age 
    ); 
 
    if (nextEvent) { 
      setIsEventConfirming(nextEvent); // 次のイベントを表示 
    } else { 
      setIsEventConfirming(null); // なければ閉じる 
    } 
  }; 

// settings
 const currentMonthlyAmount = monthlyContribution.amount * 10000;
 const settings = {
   annualIndexRate: 7,
   annualBondRate: 4,
   annualStockRate: 7,
   monthlyIndex: monthlyContribution.type === 'index' ? currentMonthlyAmount : 0,
   monthlyBond: monthlyContribution.type === 'bond' ? currentMonthlyAmount : 0,
   monthlyStock: monthlyContribution.type === 'stock' ? currentMonthlyAmount : 0, // 個別株積立も考慮する場合
 };

  // --- 資産移動（リバランス）機能 --- 
  const handleRebalance = () => { 
 
    const fromInput = prompt("どの資産から移動しますか？ (現金, 個別株, インデックス, 債券)", "インデックス"); 
    const from = fromInput ? ASSET_NAME_MAP[fromInput] : null; 
    if (!from || !['cash', 'stock', 'index', 'bond'].includes(from)) { 
      alert("正しい資産名を入力してください"); 
      return; 
    } 
 
    const amountTenThousand = Number(prompt("いくら移動しますか？（万単位で入力）", "300")); 
    if (isNaN(amountTenThousand) || amountTenThousand <= 0) return; 
    const amount = amountTenThousand * 10000; 
 
    const toInput = prompt("どの資産へ移動しますか？ (現金, 個別株, インデックス, 債券)", "債券"); 
    const to = toInput ? ASSET_NAME_MAP[toInput] : null; 
    if (!to || !['cash', 'stock', 'index', 'bond'].includes(to) || from === to) { 
      alert("正しい移動先を入力してください"); 
      return; 
    } 
 
    // 現在のRefから値をコピーして計算 
    const current = { ...assetRef.current }; 
     
    // 残高チェック 
    if (current[from as keyof typeof current] < amount) { 
      alert("移動元の資産が不足しています。"); 
      return; 
    } 
 
    // 計算 
    current[from as keyof typeof current] -= amount; 
    current[to as keyof typeof current] += amount; 
 
    // RefとStateを同期更新 
    assetRef.current = current; 
    setAssets(current); 
    setHistory(prev => [{  
      date: `${age}歳${month}月`,  
      message: `資産移動: ${from} → ${to} (¥${amountTenThousand}万)`,  
      type: 'rebalance'  
    }, ...prev]); 
    setTelop(`${from}から${to}へ ${amountTenThousand}万円移動しました`); 
  }; 
 
// 時飛ばし 
const skipTime = (years: number) => { 
  const months = years * 12; 
  const current = { ...assetRef.current }; 
   
  // 期間中の複利計算（簡易化のため平均利回りで計算） 
  const stockGrowth = Math.pow(1 + 0.06 / 12, months); 
  const indexGrowth = Math.pow(1 + 0.07 / 12, months); 
  const bondGrowth = Math.pow(1 + 0.04 / 12, months); 
 
  current.stock *= stockGrowth; 
  current.index *= indexGrowth; 
  current.bond *= bondGrowth; 
 
  // 期間中の積立合計を加算 
  const totalContribution = monthlyContribution.amount * 10000 * months; 
  current[monthlyContribution.type as keyof typeof current] += totalContribution; 
  pureCashRef.current += totalContribution; 
 
  // 年齢を更新 
  const newAge = Math.min(age + years, MAX_AGE); 
  setAge(newAge); 
  assetRef.current = current; 
  setAssets(current); 
 
  // 飛ばした期間中に発生した「未達成」のライフイベントを抽出 
  const passedEvents = lifeEvents.filter(ev =>  
    !ev.isAchieved && ev.age >= age && ev.age < newAge 
  ); 
 
  if (passedEvents.length > 0) { 
    alert(`${years}年飛ばしました。その間に発生したイベントの確認を行います。`); 
    // 最初のイベントから確認フローへ 
    setIsEventConfirming(passedEvents[0]); 
  } else { 
    setTelop(`${years}年分、時を飛ばしました`); 
  } 
}; 
 
const stopAndNext = (nextStep: number) => { 
  setIsRunning(false); 
  setTimeout(() => { 
    setAdvStep(nextStep); 
  }, 2000); 
}; 


// --- メインロジック ---
useEffect(() => {
  if (!isRunning) return;

  // チュートリアル9（回復フェーズ）は3倍速、それ以外は1倍速
  const intervalTime = (isAdvTutorial && advStep === 9) ? 333 : 1000;

  const timer = setInterval(() => {
    let { cash, stock, index: nIndex, bond } = assetRef.current;
    const { monthlyIndex, monthlyBond } = settings;
    let nextMonth = month + 1;
    let nextAge = age;

    if (nextMonth > 12) {
      nextMonth = 1;
      nextAge++;
    }

    // 1. 利回り計算
    let currentRate = settings.annualIndexRate;
// 回復フェーズ（ステップ9）の間だけ、利回りを年利20%くらいにブーストして見せる
    if (isAdvTutorial && advStep === 9) {
      currentRate = 20; 
    }
    nIndex *= (1 + (currentRate / 100) / 12);
    bond *= (1 + (settings.annualBondRate / 100) / 12);
    stock *= (1 + (settings.annualStockRate / 100) / 12);

    // 2. 為替計算 (省略せずに維持)
    let nRate = exchangeRateRef.current;
    nRate += (Math.random() - 0.5) * 2;
    exchangeRateRef.current = nRate;
    setExchangeRate(nRate);

    // 3. チュートリアル専用の暴落判定
    const isTutorialCrashMonth = isAdvTutorial && (advStep === 6 || advStep === 13) && month === 5;
    
    if (!crashState.current.isCrashing) {
      if (isTutorialCrashMonth || Math.random() < 0.01) {
        const dropRate = isTutorialCrashMonth ? 0.43 : (0.3 + Math.random() * 0.2);
        nIndex *= (1 - dropRate);
        crashState.current = {
          isCrashing: true,
          // チュートリアル時は48ヶ月(4年)固定、通常は計算
          recoveryMonths: isTutorialCrashMonth ? 36 : (dropRate > 0.4 ? 84 : 48)
        };
        setTelop(`インデックス大暴落発生! (-${Math.round(dropRate * 100)}%)`);
        setHistory(prev => [{ date: `${nextAge}歳 ${nextMonth}月`, message: "市場大暴落", type: 'crash' }, ...prev]);
      }
    } else {
      // 回復フェーズ
      crashState.current.recoveryMonths--;
      // 回復中のランダムな値下がり体験 (ステップ9の回復中のみ発生)
      if (isAdvTutorial && advStep === 9 && Math.random() < 0.05 && crashState.current.recoveryMonths > 10) {
        nIndex *= (0.95 + Math.random() * 0.03);
      }
      if (crashState.current.recoveryMonths <= 0) {
        crashState.current.isCrashing = false;
        setTelop("市場が安定しました");
      }
    }

    // 4. 資産更新とグラフデータ蓄積
    const mIndex = (isAdvTutorial && advStep <= 13) ? 0 : settings.monthlyIndex;
    const mBond = (isAdvTutorial && advStep <= 13) ? 0 : settings.monthlyBond;
    const mStock = (isAdvTutorial && advStep <= 13) ? 0 : settings.monthlyStock;

    const finalIndex = nIndex + mIndex;
    const finalBond = bond + mBond;
    const finalStock = stock + mStock;
    const finalCash = pureCashRef.current; 

    const updatedAssets = { 
      cash: finalCash, 
      stock: finalStock, 
      index: finalIndex, 
      bond: finalBond 
    };

    assetRef.current = updatedAssets;
    setAssets(updatedAssets);

    setAge(nextAge);
    setMonth(nextMonth);

    setChartData(prev => [...prev, {
      name: `${nextAge}歳 ${nextMonth}月`,
      index: Math.floor(finalIndex),
      bond: Math.floor(finalBond),
      stock: Math.floor(finalStock),
      cash: Math.floor(finalCash),
      total: Math.floor(finalIndex + finalBond + finalStock + finalCash),
    }]);

    // 5. チュートリアル進捗停止判定
    // 経過月数の計算 (15歳1月開始を基準)
    const elapsed = (nextAge - 15) * 12 + (nextMonth - 1);
    if (isAdvTutorial) {
      if (advStep === 2 && elapsed >= 5) stopAndNext(3);
      if (advStep === 6 && elapsed >= 5) stopAndNext(7);
      if (advStep === 9 && elapsed >= 48) stopAndNext(10);
      if (advStep === 13 && elapsed >= 5) stopAndNext(14);
    }
  }, intervalTime);

  return () => clearInterval(timer);
}, [isRunning, age, month, isAdvTutorial, advStep]);
 
  const totalBalance = assets.cash + assets.stock + assets.index + assets.bond; 
  const yAxisMax = totalBalance > 10000000 ? totalBalance * 1.2 : 10000000; 
 
  return ( 
    <div style={{ display: 'flex', height: '100vh', fontFamily: 'sans-serif', backgroundColor: '#fff' }}> 
      {/* 左側サイドバー */} 
      <div style={{ width: '200px', borderRight: `1px solid ${COLORS.border}`, padding: '20px', display: 'flex', flexDirection: 'column', gap: '10px' }}> 
        <button onClick={() => setIsRunning(true)} disabled={isRunning}>進む</button> 
        <button onClick={() => setIsRunning(false)} disabled={!isRunning}>止める</button> 
        <hr /> 
        <button onClick={() => { 
          const input = prompt("積立先を入力してください (現金, 個別株, インデックス, 債券):", "インデックス"); 
          const type = input ? ASSET_NAME_MAP[input] : null; 
   
          const amt = Number(prompt("毎月の積立額(万単位):", "2")); 
          if (type && !isNaN(amt)) { 
            setMonthlyContribution({ type: type as any, amount: amt }); 
            setTelop(`毎月の積立を ${input} に設定しました (${amt}万円)`); 
          } else if (input) { 
            alert("正しい資産名（現金、個別株、インデックス、債券）を入力してください。"); 
          } 
        }}>積立設定</button> 
         
        <div style={{ display: 'flex', alignItems: 'center', gap: '5px' }}> 
          <button  
            onClick={handleRebalance}  
            style={{ flex: 1, backgroundColor: '#f0f0f0', border: '1px solid #ccc', fontWeight: 'bold' }} 
          > 
            資産配分 
          </button> 
        </div> 
         
        <button onClick={() => { 
          const label = prompt("イベント名:", "結婚"); 
          if (!label) return; 
          const targetAge = Number(prompt("何歳で:", "30")); 
          const cost = Number(prompt("必要額(円):", "1000000")); 
          setLifeEvents([...lifeEvents, { id: Date.now().toString(), age: targetAge, cost, label, isAchieved: false }]); 
        }}>ライフイベント追加</button> 
 
        <button onClick={() => setIsEventListOpen(true)}>イベント確認・削除</button>  
         
        {/* 加速ボタン */} 
        <button onClick={() => { 
          const input = prompt("何倍にしますか？ (1, 1.5, 2, 3)", speedMultiplier.toString()); 
          const val = Number(input); 
          if (val > 0) { 
            setSpeedMultiplier(val); 
            setTelop(`速度を ${val} 倍に設定しました`); 
          } else if (input) { 
            alert("正の数値を入力してください"); 
          } 
        }}> 
          加速 ({speedMultiplier}倍) 
        </button> 
 
        {/* 時飛ばしボタン */} 
        <button onClick={() => { 
          const input = prompt("何年分、時を飛ばしますか？ (上限30年)", "10"); 
          const years = Number(input); 
         
          if (isNaN(years) || years <= 0) return; 
          if (years > 30) { 
            alert("一度に飛ばせるのは30年までです。"); 
            return; 
          } 
         
          // 時飛ばし実行関数（後述）を呼び出す 
          skipTime(years); 
        }}> 
          時飛ばし 
        </button> 
 
        <button onClick={() => { 
          setIsAdvTutorial(true); 
          setAdvStep(1); 
          setIsRunning(false); 
          // チュートリアル1の初期状態をセット 
          assetRef.current = { cash: 0, stock: 0, index: 5000000, bond: 0 }; 
          setAssets(assetRef.current); 
          setAge(15); setMonth(1); 
        }}> 
          チュートリアル 
        </button> 
 
        <button onClick={() => { 
        // 既に開いているなら閉じ、閉じているなら開く（常にメニューから開始）2変更 
          setIsHelpOpen(!isHelpOpen); 
          setHelpPage('menu'); 
          if (!isHelpOpen) setIsRunning(false); // ヘルプ中は時間を止める 
        }}> 
          ヘルプ 
        </button> 
 
      {/* アンケート案内とリンクの追加 */} 
      <div style={{ marginTop: 'auto', fontSize: '12px', borderTop: `1px solid ${COLORS.border}`, paddingTop: '10px' }}> 
        <div style={{ marginBottom: '5px', fontWeight: 'bold', color: '#333' }}> 
          比較対象のツールです！ 
        </div> 
        <a  
          href="https://www.fsa.go.jp/policy/nisa2/tsumitate-simulator/" 
          target="_blank"
          rel="noopener noreferrer"  
          style={{ color: '#007bff', textDecoration: 'underline', cursor: 'pointer', display: 'block', marginBottom: '10px' }} 
        > 
          金融庁 つみたてシミュレーター 
        </a> 
       
        <div style={{ marginBottom: '5px', fontWeight: 'bold', color: '#333' }}> 
          よろしければアンケートにお答えください！ 
        </div> 
        <a  
          href="https://docs.google.com/forms/d/e/1FAIpQLSema3iPaTCkNS7e2lGywhfXYBwj4KXSv8y5j62jtpjiBrhMBw/viewform?usp=dialog" 
          target="_blank"  
          rel="noopener noreferrer"  
          style={{ color: '#007bff', textDecoration: 'underline', cursor: 'pointer', display: 'block', marginBottom: '10px' }} 
        > 
          https://docs.google.com/forms 
        </a> 
           
          <div>称号: {score >= 170 ? 'A' : score >= 100 ? 'B' : 'なし'}</div> 
          <div>スコア: {score}</div> 
        </div> 
      </div> 
 
      {/* メイン表示エリア */} 
      <div style={{ flex: 1, padding: '20px', position: 'relative' }}> 
        <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '20px' }}> 
          <div> 
            <h2 style={{ margin: 0 }}>{age}歳 {month}月</h2> 
            <div style={{ fontSize: '14px', color: '#666' }}>1ドル = {exchangeRate.toFixed(2)}円</div> 
          </div> 
          <div style={{ textAlign: 'right' }}> 
            <div style={{ fontSize: '24px', fontWeight: 'bold' }}>¥{Math.floor(totalBalance).toLocaleString()}</div> 
            <div style={{ display: 'flex', width: '300px', height: '10px', borderRadius: '5px', overflow: 'hidden', marginTop: '5px', border: '1px solid #ddd' }}> 
              <div style={{ width: `${(assets.cash / (totalBalance || 1)) * 100}%`, backgroundColor: COLORS.cash }} /> 
              <div style={{ width: `${(assets.stock / (totalBalance || 1)) * 100}%`, backgroundColor: COLORS.stock }} /> 
              <div style={{ width: `${(assets.index / (totalBalance || 1)) * 100}%`, backgroundColor: COLORS.index }} /> 
              <div style={{ width: `${(assets.bond / (totalBalance || 1)) * 100}%`, backgroundColor: COLORS.bond }} /> 
            </div> 
          </div> 
        </div> 
        {isEventConfirming && ( 
          <div style={{ 
            position: 'absolute', 
            top: '50%', 
            left: '50%', 
            transform: 'translate(-50%, -50%)', 
            backgroundColor: 'white', 
            padding: '30px', 
            border: '3px solid #333', 
            zIndex: 100, 
            textAlign: 'center', 
            boxShadow: '0 0 20px rgba(0,0,0,0.5)', 
            borderRadius: '10px', 
            minWidth: '300px' 
          }}> 
            <h3 style={{ marginTop: 0 }}>ライフイベント発生！</h3> 
            <p style={{ fontSize: '18px', fontWeight: 'bold' }}>{isEventConfirming.label}</p> 
            <p>必要金額: <span style={{ color: '#d32f2f', fontWeight: 'bold' }}>¥{isEventConfirming.cost.toLocaleString()}</span></p> 
            <p style={{ fontSize: '14px', color: '#666' }}>このイベントにお金を使いますか？</p> 
             
            <div style={{ display: 'flex', gap: '20px', justifyContent: 'center', marginTop: '20px' }}> 
              <button  
                onClick={() => startPaymentFlow(isEventConfirming)}  
                style={{ padding: '10px 20px', backgroundColor: '#4caf50', color: 'white', border: 'none', borderRadius: '5px', cursor: 'pointer', fontWeight: 'bold' }} 
              > 
                決定（支払いへ） 
              </button> 
              <button  
                onClick={() => { 
                  setLifeEvents(prev => prev.map(e => e.id === isEventConfirming.id ? { ...e, isAchieved: true } : e)); 
                   
                  // 次のイベントチェック　キャンセルボタン処理 
                  const nextEvent = lifeEvents.find(e =>  
                    e.id !== isEventConfirming.id && !e.isAchieved && e.age <= age 
                  ); 
                   
                  if (nextEvent) { 
                    setIsEventConfirming(nextEvent); 
                  } else { 
                    setIsEventConfirming(null); 
                  } 
                  setTelop(`「${isEventConfirming.label}」を見送りました`); 
                }} 
                style={{ padding: '10px 20px', backgroundColor: '#f44336', color: 'white', border: 'none', borderRadius: '5px', cursor: 'pointer' }} 
              > 
                キャンセル 
              </button> 
            </div> 
          </div> 
        )} 
 
        {isTutorialOpen && ( 
          <div style={{ 
            position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', 
            width: '80%', height: '60%', backgroundColor: 'white', border: '4px solid #333', 
            zIndex: 200, display: 'flex', flexDirection: 'column', justifyContent: 'center', 
            alignItems: 'center', padding: '40px', boxSizing: 'border-box', textAlign: 'center' 
          }}> 
            <div style={{ fontSize: '24px', fontWeight: 'bold', lineHeight: '1.6', color: '#333' }}> 
              {tutorialMessages[tutorialStep]} 
            </div> 
 
            {/* 逆三角ボタン */} 
            <div  
              onClick={() => { 
                if (tutorialStep < tutorialMessages.length - 1) { 
                  setTutorialStep(tutorialStep + 1); 
                } else { 
                  setIsTutorialOpen(false); 
                } 
              }} 
              style={{ 
                position: 'absolute', bottom: '30px', right: '40px', cursor: 'pointer', 
                width: '0', height: '0', borderLeft: '20px solid transparent', 
                borderRight: '20px solid transparent', borderTop: '30px solid #333', 
                transition: 'transform 0.1s' 
              }} 
              onMouseEnter={(e) => e.currentTarget.style.transform = 'scale(1.2)'} 
              onMouseLeave={(e) => e.currentTarget.style.transform = 'scale(1.0)'} 
            /> 
          </div> 
        )} 
 
        {isAdvTutorial && (
            <div style={{
              position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)',
              backgroundColor: 'rgba(255,255,255,0.95)', padding: '30px', borderRadius: '15px',
              border: '2px solid #333', zIndex: 1000, textAlign: 'center', width: '400px'
            }}>
              <div style={{ marginBottom: '20px', lineHeight: '1.6' }}>
                {advStep === 1 && "まずは投資をしてみましょう！"}
                {advStep === 2 && "進むボタンを押してください"}
                {advStep === 3 && (
                  <>
                    どうでしたか？
                    <br />
                    たった4ヶ月で500万円が515万円弱になりましたね
                  </>
                )}
                {advStep === 4 && "普通に貯金するよりも「お金が働いてくれる」分、よりお金がたまりますね！"}
                {advStep === 5 && "しかし、良いことだけではありません。もう一度「進む」ボタンを押してみましょう！"}
                {advStep === 6 && isRunning && "何が起きるでしょうか..."}
                {advStep === 6 && !isRunning && "進むボタンを押してみてください"}
                {advStep === 7 && "このように、投資は万能ではありません。もし投資をするなら、暴落の可能性も頭に入れておく必要があります。"}
                {advStep === 8 && "インデックス投資なら暴落しても少しずつ上昇するので、時間さえあれば回復はしていきます。（目安は4~10年ですが、コロナショックのように1年経たず回復する場合も特例ですがあります）"}
                {advStep === 9 && "回復の様子を早送りで見てみましょう"}
                {advStep === 10 && "では、私たちに対策できることはあるでしょうか？"}
                {advStep === 11 && "そんなときこそ「債券」「現金」の出番です"}
                {advStep === 12 && "インデックスを300万、債券を100万、現金を100万にして進んでみましょう！"}
                {advStep === 13 && !isRunning && "進むボタンを押してください"}
                {advStep === 14 && "先ほどより暴落が80万円ほど抑えられていますね！"}
                {advStep === 15 && "債券や現金は利回りが低いので、暴落させたくない（例えばあと数か月後に大量にお金が必要な時など）への使用がオススメです"}
                {advStep === 16 && "一応、個別株の話もしておきます"}
                {advStep === 17 && "簡単にいうと結構なギャンブルです（Amazonやappleは20年で100倍以上になりましたし、逆にトヨタは株価が-83%になったこともあります）"}
                {advStep === 18 && "シミュレーションなので一発掛けてみるのも面白いかもしれませんが、現実ではよく考えるようにしましょう"}
                {advStep === 19 && "以上でチュートリアルを終わります。最後まで見ていただきありがとうございました！"}
              </div>
          
              {/* シミュレーション実行中以外のステップで「次へ」ボタンを表示 */}
              {![2, 6, 9, 13].includes(advStep) && (
                <button
                  style={{ padding: '10px 25px', cursor: 'pointer', backgroundColor: '#333', color: '#fff', border: 'none', borderRadius: '5px' }}
                  onClick={() => {
                    if (advStep === 1) {
                      // ステップ2の準備
                      assetRef.current = { cash: 0, stock: 0, index: 5000000, bond: 0 };
                      pureCashRef.current = 0;
                      setAssets(assetRef.current);
                      setAge(15); setMonth(1); setChartData([]);
                      setAdvStep(2);
                    } else if (advStep === 5) {
                      // ステップ6の準備（500万）
                      assetRef.current = { cash: 0, stock: 0, index: 5000000, bond: 0 };
                      pureCashRef.current = 0;
                      setAssets(assetRef.current);
                      setAge(15); setMonth(1); setChartData([]);
                      setAdvStep(6);
                    } else if (advStep === 8) {
                      setAdvStep(9);
                      setIsRunning(true); // 回復フェーズは自動開始
                    } else if (advStep === 12) {
                      // ステップ13の準備（分散投資）
                      assetRef.current = { cash: 1000000, stock: 0, index: 3000000, bond: 1000000 };
                      pureCashRef.current = 1000000;
                      setAssets(assetRef.current);
                      setAge(15); setMonth(1); setChartData([]);
                      setAdvStep(13);
                    } else if (advStep === 19) {
                      setIsAdvTutorial(false);
                      setAdvStep(0);
                      window.location.reload(); // ページを再読み込み
                      return;
                    } else {
                      setAdvStep(advStep + 1);
                    }
                  }}
                >
                  {advStep === 19 ? "終了する" : "次へ"}
                </button>
              )}
            </div>
          )}
 
        {/* --- ヘルプオーバーレイ --- */} 
        {isHelpOpen && ( 
          <div style={{ 
            position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', 
            width: '80%', height: '65%', backgroundColor: '#d1e0e5', border: '3px solid #000', 
            zIndex: 300, display: 'flex', flexDirection: 'column', boxSizing: 'border-box' 
          }}> 
            {helpPage === 'menu' ? ( 
              /* メニューリスト画面 */ 
              <div style={{ display: 'flex', flexDirection: 'column', height: '100%', overflowY: 'auto' }}> 
                {Object.keys(helpContent).map(title => ( 
                  <div key={title} style={{ display: 'flex', borderBottom: '2px solid #000', backgroundColor: '#d1e0e5' }}> 
                    <div style={{ flex: 1, padding: '20px', fontSize: '24px', fontWeight: 'bold', borderRight: '2px solid #000' }}> 
                      {title} 
                    </div> 
                    <div  
                      onClick={() => { setSelectedHelpTitle(title); setHelpPage('detail'); }} 
                      style={{ width: '100px', display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer', backgroundColor: '#d1e0e5' }} 
                    > 
                      <div style={{ width: 0, height: 0, borderTop: '15px solid transparent', borderBottom: '15px solid transparent', borderLeft: '20px solid #f3e5ab' }} /> 
                    </div> 
                  </div> 
                ))} 
              </div> 
            ) : ( 
              /* 詳細画面 */ 
              <div style={{ position: 'relative', height: '100%', padding: '40px', boxSizing: 'border-box' }}> 
                <div style={{ display: 'flex', alignItems: 'center', borderBottom: '2px solid #000', paddingBottom: '10px', marginBottom: '30px' }}> 
                  <div  
                    onClick={() => setHelpPage('menu')} 
                    style={{ cursor: 'pointer', display: 'flex', alignItems: 'center', marginRight: '20px' }} 
                  > 
                    <div style={{ width: 0, height: 0, borderTop: '15px solid transparent', borderBottom: '15px solid transparent', borderRight: '20px solid #f3e5ab' }} /> 
                  </div> 
                  <h2 style={{ margin: 0, fontSize: '28px' }}>{selectedHelpTitle}</h2> 
                </div> 
                <div style={{ fontSize: '22px', fontWeight: 'bold', lineHeight: '1.8' }}> 
                  {helpContent[selectedHelpTitle]?.map((line, i) => ( 
                    <p key={i} style={{ margin: '15px 0' }}>{line}</p> 
                  ))} 
                </div> 
              </div> 
            )} 
          </div> 
        )} 
 
        {/* --- ライフイベント管理ウィンドウ ---  2変更*/} 
        {isEventListOpen && ( 
          <div style={{ 
            position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', 
            width: '80%', height: '70%', backgroundColor: '#fdf5e6', border: '3px solid #000', 
            zIndex: 400, padding: '20px', overflowY: 'auto' 
          }}> 
            <div style={{ display: 'flex', justifyContent: 'space-between', borderBottom: '2px solid #000', marginBottom: '15px' }}> 
              <h2 style={{ margin: 0 }}>シミュレーション設定・イベント管理</h2> 
              <button onClick={() => setIsEventListOpen(false)}>閉じる</button> 
            </div> 
 
            {/* --- ここから追加：現在の年齢変更セクション --- */} 
            <div style={{  
              backgroundColor: '#fff',  
              padding: '15px',  
              border: '2px solid #333',  
              marginBottom: '20px', 
              display: 'flex', 
              alignItems: 'center', 
              gap: '15px' 
            }}> 
              <strong style={{ fontSize: '16px' }}>現在の年齢を変更:</strong> 
              <input  
                type="number"  
                value={age}  
                onChange={(e) => setAge(Number(e.target.value))} 
                style={{ width: '60px', padding: '5px', fontSize: '16px', fontWeight: 'bold' }} 
              /> 
              <span>歳</span> 
              <p style={{ margin: 0, fontSize: '12px', color: '#666' }}> 
                ※時間を進める前に設定してください。 
              </p> 
            </div> 
            {/* --- ここまで追加 --- */} 
 
            <h3 style={{ borderBottom: '1px solid #ccc', paddingBottom: '5px' }}>登録済みイベント</h3> 
           
            {lifeEvents.filter(e => !e.isAchieved).length === 0 ? ( 
              <p>予定されているイベントはありません</p> 
            ) : ( 
              lifeEvents.filter(e => !e.isAchieved).map(event => ( 
                <div key={event.id} style={{ 
                  display: 'flex', justifyContent: 'space-between', alignItems: 'center', 
                  padding: '10px', border: '1px solid #000', marginBottom: '5px', backgroundColor: '#fff' 
                }}> 
                  <div> 
                    <input  
                      type="number"  
                      value={event.age}  
                      onChange={(e) => updateEventAge(event.id, Number(e.target.value))} 
                      style={{ width: '50px', marginRight: '5px', fontWeight: 'bold', border: '1px solid #ccc', padding: '2px' }} 
                    /> 
                    <span style={{ fontWeight: 'bold' }}>歳:</span> {event.label}  
                    <span style={{ marginLeft: '10px', color: '#666' }}>({event.cost.toLocaleString()}円)</span> 
                  </div> 
                   
                  <button  
                    style={{ backgroundColor: '#ffcccb', cursor: 'pointer', border: '1px solid #000', padding: '5px 10px' }} 
                    onClick={() => { 
                      setLifeEvents(prev => prev.filter(e => e.id !== event.id)); 
                      setTelop(`「${event.label}」を削除しました`); 
                    }} 
                  > 
                    削除 
                  </button> 
                </div> 
              )) 
            )} 
          </div> 
        )} 
 
        {/* ライフイベント進捗バー */} 
        <div style={{ position: 'relative', height: '40px', backgroundColor: '#f9f9f9', marginBottom: '20px', borderBottom: '1px solid #eee' }}> 
          <span style={{ position: 'absolute', left: 0, top: -15, fontSize: '10px' }}>15歳</span> 
          <span style={{ position: 'absolute', right: 0, top: -15, fontSize: '10px' }}>85歳</span> 
          <div style={{ position: 'absolute', left: `${((age - 15) / 70) * 100}%`, top: '50%', transform: 'translate(-50%, -50%)', width: '12px', height: '12px', backgroundColor: 'red', borderRadius: '50%', zIndex: 2 }} /> 
          {lifeEvents.map(ev => ( 
            <div key={ev.id} style={{ position: 'absolute', left: `${((ev.age - 15) / 70) * 100}%`, height: '100%', width: '2px', backgroundColor: ev.isAchieved ? '#4caf50' : '#ccc' }}> 
              <div style={{ position: 'absolute', bottom: -18, fontSize: '9px', whiteSpace: 'nowrap', transform: 'translateX(-50%)', color: ev.isAchieved ? '#4caf50' : '#000' }}> 
                {ev.label} 
              </div> 
            </div> 
          ))} 
        </div> 
 
          <button  
            onClick={() => { setIsTutorialOpen(true); setTutorialStep(0); setIsRunning(false); }} 
            style={{  
              width: '30px', height: '30px', borderRadius: '50%', border: '1px solid #ccc',  
              backgroundColor: '#fff', cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center', 
              fontWeight: 'bold', fontStyle: 'italic', color: '#666' 
            }} 
          > 
            i 
          </button> 
 
        <div style={{ height: '350px', width: '100%' }}> 
          <ResponsiveContainer> 
            <AreaChart data={chartData}> 
              <CartesianGrid strokeDasharray="3 3" vertical={false} /> 
              <XAxis dataKey="name" hide /> 
              <YAxis domain={[0, yAxisMax]} tickFormatter={(val) => `${val / 10000}万`} /> 
              <Tooltip 
               formatter={(value: any, name: any) => { 
                 if (typeof value === 'number') { 
                   // 数値をカンマ区切りにして、末尾に「円」をつけ、項目名(name)を表示する
                   return [`${Math.floor(value).toLocaleString()}円`, name]; 
                 } 
                 return [value, name]; 
               }}  
              />
              <Area name="現金" type="monotone" dataKey="cash" stackId="1" stroke={COLORS.cash} fill={COLORS.cash} isAnimationActive={false} /> 
              <Area name="個別株" type="monotone" dataKey="stock" stackId="1" stroke={COLORS.stock} fill={COLORS.stock} isAnimationActive={false} /> 
              <Area name="インデックス" type="monotone" dataKey="index" stackId="1" stroke={COLORS.index} fill={COLORS.index} isAnimationActive={false} /> 
              <Area name="債券" type="monotone" dataKey="bond" stackId="1" stroke={COLORS.bond} fill={COLORS.bond} isAnimationActive={false} /> 
              <Line  
                name="元本（積立なし）"
                type="monotone"  
                dataKey="pureCash"  
                stroke={COLORS.pureCash}  
                strokeDasharray="5 5"  
                dot={false}  
                isAnimationActive={false}  
                strokeWidth={2}  
              />
              <Line  
                type="monotone"  
                dataKey="pureCash"  
                stroke={COLORS.pureCash}  
                strokeDasharray="5 5"  
                dot={false}  
                isAnimationActive={false}  
                strokeWidth={2}  
              /> 
            </AreaChart> 
          </ResponsiveContainer> 
        </div> 
 
        <div style={{ marginTop: '0px', height: '30px', color: '#d32f2f', fontWeight: 'bold', textAlign: 'center' }}> 
          {telop} 
        </div> 
 
        <div style={{ marginTop: '0px', fontSize: '18px', borderTop: '1px solid #eee', paddingTop: '10px' }}> 
          <strong>履歴:</strong> 
          <div style={{ maxHeight: '100px', overflowY: 'auto' }}> 
            {history.map((h, i) => ( 
              <div key={i}>{h.date}: {h.message}</div> 
            ))} 
          </div> 
        </div> 
      </div> 
    </div> 
  ); 
};
 
export default InvestmentSimulator; 
