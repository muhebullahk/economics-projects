# Chapter 2: Shortcuts and Errors — Heuristics and the Biases They Produce

---

## Chapter Overview

Chapter 1 established that human beings systematically violate the predictions of the standard rational choice model. But identifying *that* people deviate from rational behaviour raises a deeper question: *why* do they deviate, and in what directions? Random errors would wash out in aggregate and would matter little for economic analysis. The reason behavioural economics is more than a catalogue of curiosities is that the deviations are not random — they are systematic, predictable, and produced by identifiable cognitive mechanisms.

This chapter examines those mechanisms: the **heuristics**, or mental shortcuts, that human beings rely on when making judgements and decisions. Heuristics are adaptive strategies. They allow us to make reasonable decisions quickly, with limited information and limited cognitive resources. For the vast majority of everyday decisions — reading a situation, recognising a face, choosing a familiar product — heuristics work well and are essential. They are not bugs in human cognition; they are features of a system that evolved to function effectively in a complex world.

The problem is that heuristics occasionally misfire in predictable ways. When a heuristic that works well in one context is applied to a different context — particularly in structured problems involving probabilities, frequencies, or numbers — it can produce systematic errors called **biases**. These biases are not idiosyncratic mistakes of individuals; they are shared patterns observed across populations, cultures, and even among trained experts.

We examine five major heuristics in this chapter: **representativeness**, **availability**, **anchoring and adjustment**, **confirmation bias**, and **overconfidence**. For each, we establish the mechanism, explain when and why it fails, review the experimental evidence, and analyse the economic consequences. We conclude with a discussion of how heuristics interact, the debate about whether heuristics are actually irrational, and what — if anything — can be done to reduce harmful biases.

---

## Learning Objectives

After studying this chapter, students should be able to:

1. **Define** heuristics and explain why they exist as cognitive strategies, distinguishing them from irrationality.
2. **Explain** the representativeness heuristic and identify the biases it produces, including base rate neglect, the conjunction fallacy, and the gambler's fallacy.
3. **Explain** the availability heuristic and identify the biases it produces, including risk misperception and availability cascades.
4. **Explain** the anchoring and adjustment heuristic and identify economic contexts where anchoring has measurable consequences.
5. **Define** confirmation bias and explain the Wason selection task as evidence for it.
6. **Distinguish** the three types of overconfidence — overprecision, overplacement, and overestimation — and explain their economic consequences.
7. **Describe** the Dunning-Kruger effect and its implications for self-assessment in economic settings.
8. **Explain** how heuristics interact and amplify each other's effects.
9. **Apply** the heuristics framework to real-world economic problems including medical diagnosis, financial decision-making, legal judgement, and marketing.
10. **Critically evaluate** Gigerenzer's argument that heuristics are ecologically rational, and assess the scope and limits of de-biasing strategies.

---

## Introduction: The Mind That Jumps to Conclusions

Before reading the next paragraph, answer this question immediately, without calculating: Is the population of Canada larger or smaller than 10 million people?

Almost certainly you answered "larger." Now: does your answer to that question shift your estimate of Canada's actual population upward, even slightly? If it does — if knowing the comparison value of 10 million has somehow coloured your subsequent thinking — then you have just experienced the anchoring effect in real time, on yourself, despite being told it was about to happen.

This is what makes heuristics remarkable, and what makes them economically important: they operate even when we know about them. They are not mere habits that vanish under scrutiny. They are features of how human cognition works — fast, efficient, and operating largely below the level of conscious awareness.

The study of heuristics and biases began in earnest in the early 1970s, with a series of papers by the Israeli psychologists Amos Tversky and Daniel Kahneman. Working initially on problems in probability judgement, they identified a small set of mental shortcuts that explained a surprisingly large fraction of human errors in uncertain situations. Their 1974 paper, "Judgment under Uncertainty: Heuristics and Biases," published in *Science*, became one of the most cited papers in all of social science and laid the foundation for the field that would become behavioural economics.

Kahneman later synthesised decades of this research in his 2011 book *Thinking, Fast and Slow*, in which the dual-process framework — System 1 versus System 2 — provides the cognitive architecture within which heuristics and biases can be understood. That framework, introduced in Chapter 1, is the starting point for this chapter.

---

## 1. Decision Fatigue: When System 2 Runs Out of Fuel

Before turning to individual heuristics, it is important to understand a crucial fact about System 2 that shapes when heuristics take over: **System 2 is depletable**.

The effort required to engage in deliberate, analytical reasoning draws on a finite cognitive resource. When that resource is depleted — whether by sustained mental effort, decision-making, or emotional stress — System 2 becomes less able to override the automatic outputs of System 1. People fall back on simpler rules, more habitual responses, and default options.

This phenomenon is called **decision fatigue** or **ego depletion**, and it has been documented in a range of settings. One of the most vivid demonstrations comes from a study of judicial decision-making.

> **Research Study: The Israeli Parole Board**
>
> **Researchers:** Shai Danziger, Jonathan Levav, and Liora Avnaim-Pesso
> **Year:** 2011
> **Research Question:** Does the timing of a parole hearing within a judge's day affect the probability of a favourable ruling?
> **Method:** The researchers analysed 1,112 parole board decisions made across ten months by eight experienced Israeli parole judges. Each day was divided into sessions separated by food breaks. The researchers recorded the proportion of favourable rulings (parole granted) at different points in the day.
> **Results:** At the start of each session (immediately after a break), the approval rate was approximately 65%. This rate declined steadily as the session progressed, falling toward 0% just before each break. Immediately after the break, the approval rate reset to approximately 65%. This cycle repeated three times per day.
> **Economic Interpretation:** Granting parole requires a complex, effortful judgement about risk and rehabilitation — a System 2 task. As cognitive resources depleted over the session, judges defaulted to the safe, low-effort choice: denial of parole (the status quo). The prisoner's fate was partly determined by when their hearing was scheduled — an irrelevant factor under any standard model of judicial reasoning.
> **Behavioural Insight:** Decision fatigue does not make judgements random; it makes them systematically conservative, biased toward the default option. When System 2 is depleted, System 1 takes over, and the easiest choice — doing nothing, maintaining the status quo — dominates.

**Figure 2.1: Decision Fatigue in Parole Hearings**

```
% Favourable
Rulings ↑
        │  ●                    ●                    ●
   65%  ┤  │ \                  │ \                  │ \
        │  │  \                 │  \                 │  \
   50%  ┤  │   \                │   \                │   \
        │  │    \               │    \               │    \
   35%  ┤  │     \              │     \              │     \
        │  │      \             │      \             │      \
   20%  ┤  │       \            │       \            │       \
        │  │        \           │        \           │        \
    5%  ┤  │         \          │         \          │         \
        │  │          ●         │          ●         │          ●
    0%  ┼──┴──────────┴─────────┴──────────┴─────────┴──────────┴──→
        1                      12                   24         35
           ◄── Morning ──►  │  ◄─── Afternoon ──►  │  ◄─ Late ──►
                           FOOD                  LUNCH
                           BREAK                 BREAK
                            ↑ Reset to 65%         ↑ Reset to 65%

        Hearing number within session →
        Each session: approval rate falls from ~65% toward 0%
        Break resets cognitive resources → approval rate resets
```

| | Description |
|---|---|
| **What the figure shows** | The proportion of favourable (parole-granting) rulings over the course of a judge's day. The line starts high (~65%) at the beginning of a session, falls steeply as the session progresses toward a food break, then resets to ~65% immediately after the break. This pattern repeats three times — once for the morning session, once after lunch, once after the afternoon snack break. |
| **How to interpret it** | The resets at break times rule out a gradual learning or case-selection explanation. The pattern is consistent with cognitive depletion: the more decisions judges have made, the less able they are to engage System 2 deliberation, and the more they default to denial. |

Decision fatigue has been documented beyond the courtroom. Studies of physicians show that patients seen later in the day are more likely to receive inappropriate antibiotic prescriptions — an easy default that avoids the cognitive effort of differential diagnosis. Consumers who have made many decisions in a shopping session show reduced ability to evaluate complex financial products. Online shoppers who complete purchases late in the evening, after a full day of decision-making, select fewer product customisations and default more readily to standard options.

The implication for economics is significant: whether a decision is System 2-quality is not solely a function of the person's ability or the decision's importance — it is also a function of **when** the decision is made and how many prior decisions have been made that day.

---

## 2. The Representativeness Heuristic

### 2.1 What It Is and Why We Use It

The **representativeness heuristic** is the tendency to judge the probability that an object belongs to a category — or that an event was generated by a particular process — by asking how closely it **resembles** a prototype of that category.

In formal terms, when estimating $P(A|B)$ — the probability that hypothesis $A$ is true, given that evidence $B$ has been observed — people substitute the question with a simpler one: "How much does $B$ look like what we would expect to see if $A$ were true?" The answer to that similarity question is then used as a direct estimate of the probability.

This is often a reasonable strategy. The world does contain real patterns, and things that resemble members of a category often do belong to it. A person who dresses formally, speaks precisely, and carries a briefcase really is more likely to be an accountant than a surfer. Representativeness exploits genuine statistical regularities.

The problem is that representativeness ignores information that the laws of probability require to be taken into account — most importantly, **base rates** (how common the category is in the population) and **sample size** (how many observations we have). When resemblance conflicts with these structural features of probability, representativeness wins — and the answer is wrong.

### 2.2 Base Rate Neglect

The most economically important failure of representativeness is **base rate neglect**: the tendency to underweight, or completely ignore, prior probabilities when forming probability judgements.

**The Classic Example.** Tom W. is a quiet, detail-oriented man who enjoys solving puzzles and reading science fiction. Is he more likely to be a librarian or a truck driver?

Most people say librarian: Tom resembles the stereotype. But this ignores the base rates. In the United States, there are approximately 3.5 million truck drivers and 170,000 librarians. Even if Tom "fits" the librarian profile perfectly, the sheer numerical preponderance of truck drivers should dominate. The probability that a randomly selected individual is a truck driver is more than twenty times larger than the probability that they are a librarian. Bayesian probability requires that this base rate be incorporated.

Formally, Bayes' rule states:

$$P(A|B) = \frac{P(B|A) \cdot P(A)}{P(B)}$$

where:
- $P(A|B)$ is the **posterior probability**: the probability of hypothesis $A$ given evidence $B$
- $P(B|A)$ is the **likelihood**: how probable the evidence is if $A$ is true (resemblance)
- $P(A)$ is the **prior probability**: the base rate of $A$ before observing $B$
- $P(B)$ is the probability of observing the evidence under all possible hypotheses

Representativeness focuses on $P(B|A)$ — the likelihood — and ignores $P(A)$ — the prior. Even a very high likelihood ratio can be overwhelmed by a small prior when the base rate is low.

**Medical Diagnosis: A High-Stakes Application.** Base rate neglect has serious consequences in medical settings. Consider the following scenario, similar to one used by Kahneman and Tversky in their research:

A disease affects 1 person in every 1,000. A diagnostic test for the disease has a 99% accuracy rate: it correctly identifies 99% of diseased patients (sensitivity) and correctly classifies 99% of healthy patients (specificity, implying a 1% false-positive rate). You test positive. What is the probability you have the disease?

Most people answer approximately 99%. The correct answer is approximately 9%.

Here is why. Consider 1,000 people tested:
- 1 person has the disease. The test will correctly identify them as positive (true positive): **1 positive result**.
- 999 people are healthy. The test will falsely flag 1% of them: $0.01 \times 999 \approx 10$ false positives: **10 positive results**.

Of the approximately 11 people who test positive, only 1 actually has the disease. The probability of having the disease given a positive test is $1/11 \approx 9\%$.

The intuitive answer of 99% reflects representativeness: a positive test result strongly resembles what we expect from a diseased patient. The correct Bayesian answer is dominated by the base rate (1 in 1,000), which makes false positives far more common than true positives even with a highly accurate test. Graber and colleagues (2005) estimated that diagnostic errors affect approximately 15% of clinical cases. In Canada, the Canadian Patient Safety Institute (2004) documented approximately 50,000 preventable patient harms per year linked to diagnostic errors, with cognitive biases — including base rate neglect — playing a major contributing role.

**Table 2.1: The Medical Test Example Using Frequencies**

| | Has Disease | Does Not Have Disease | Total |
|---|---|---|---|
| **Tests Positive** | 1 (true positive) | 10 (false positive) | 11 |
| **Tests Negative** | 0 (false negative) | 989 (true negative) | 989 |
| **Total** | 1 | 999 | 1,000 |

*Probability of disease given positive test = 1/11 ≈ 9%, not 99%.*

The reason frequency formats (like this table) make the correct answer more accessible is an important finding in itself. Gigerenzer and Hoffrage (1995) showed that presenting the same statistical problem in terms of frequencies rather than probabilities substantially reduced base rate neglect. This has practical implications for how statistical information should be communicated in medical and policy contexts.

---

### 2.3 The Conjunction Fallacy

A second important failure generated by representativeness is the **conjunction fallacy**: the belief that the conjunction of two events is more probable than either event alone. This violates a fundamental rule of probability: for any events $A$ and $B$:

$$P(A \cap B) \leq P(A) \quad \text{and} \quad P(A \cap B) \leq P(B)$$

Adding conditions can only reduce or maintain probability — never increase it. The set of "people who are bank tellers and feminists" is necessarily a subset of "people who are bank tellers."

Yet Tversky and Kahneman (1983) showed that most people violate this rule when a conjunction is more representative — more resembling — of a described case than either event alone.

> **Research Study: The Linda Problem**
>
> **Researchers:** Amos Tversky and Daniel Kahneman
> **Year:** 1983
> **Research Question:** Will people assign higher probability to a conjunction of events than to one of its constituent events?
> **Method:** Participants were given the following description: "Linda is 31 years old, single, outspoken, and very bright. She majored in philosophy. As a student, she was deeply concerned with issues of discrimination and social justice, and participated in anti-nuclear demonstrations." They were then asked to rank the following statements from most to least probable:
> - (A) Linda is a bank teller.
> - (B) Linda is a bank teller and is active in the feminist movement.
>
> **Results:** 85–90% of participants rated (B) as more probable than (A), committing the conjunction fallacy. This result held even when the participants were graduate students in decision science who knew about probability theory — 85% of them still committed the fallacy.
> **Economic Interpretation:** The laws of probability are unambiguous: $P(\text{bank teller and feminist}) \leq P(\text{bank teller})$. Any ranking that places the conjunction higher than the single event is mathematically impossible to justify. Yet the conjunction "fits" Linda's description better — it is more representative — causing people to rate it as more likely.
> **Behavioural Insight:** The Linda problem demonstrates that people evaluate probability by resemblance, not by probability theory. Descriptions that build a coherent narrative increase their judged likelihood even when the additional details logically reduce it.

**Economic Applications of the Conjunction Fallacy.** This bias has real consequences in financial and business settings:

- **Scenario planning.** The more detailed a business plan or investment scenario is, the more vivid and coherent it seems — and the more likely investors rate it. Yet additional details make a scenario less likely from a purely probabilistic perspective. Investors who are overly impressed by detailed narratives may overpay for speculative assets with compelling stories.
- **Financial news.** Headlines that explain a market movement with a specific conjunction of causes ("Stocks rose because of strong jobs data *and* easing inflation *and* positive Fed commentary") feel more satisfying and more plausible than "Stocks rose." The additional specificity is actually probabilistically disadvantageous, but it increases the narrative's perceived reliability.
- **Legal reasoning.** Juries who hear detailed narratives about how a defendant committed a crime may find those scenarios more plausible than a bare description of guilt — even when the detailed scenario is, by definition, a subset of all the ways in which the defendant could be guilty.

---

### 2.4 The Gambler's Fallacy

A third consequence of representativeness is the **gambler's fallacy**: the mistaken belief that in a random process, a run of one outcome makes the opposite outcome "due."

The intuition is straightforward. A sequence of five heads in a row — HHHHH — does not *look* random. A sequence like HTTHHT looks much more like what we expect from a fair coin. Because representativeness uses resemblance to a prototype of "randomness" as a guide, a sequence that doesn't look random is judged to be unlikely to continue. The coin is expected to "self-correct."

This is a logical error. Each coin flip is an independent event. The probability of heads on the next flip is exactly 0.5, regardless of what the previous five flips showed. The coin has no memory. Yet the belief that the sequence is about to reverse is extremely widespread.

The gambler's fallacy has documented consequences outside casinos:

**Lottery behaviour.** Survey research consistently finds that lottery players avoid recently drawn numbers, believing them to be less likely to appear again soon. Since lottery draws are independent, this belief has no basis and affects only which tickets people choose to buy, not their expected winnings.

**Lending decisions.** Rao, Chen, and Raj (2019) analysed a large dataset of loan applications processed by US loan officers. They found that officers were less likely to approve a loan application after approving the previous one — consistent with the gambler's fallacy: the officer believed that approving several loans in a row made the next approval "too many." Applications that were objectively equivalent received different decisions based on the sequence in which they arrived.

**Sports commentary.** The gambler's fallacy is common in sports analysis: "He's due for a hit" after a batting slump, or "She's bound to miss" after several successes. These predictions are wrong for any outcome that is genuinely probabilistic.

**Figure 2.2: The Gambler's Fallacy**

```
  Coin flip sequence:   H   H   H   H   H   H   H   →   ?
                        ─   ─   ─   ─   ─   ─   ─       ─
  Flip #:               1   2   3   4   5   6   7

  What does the gambler believe about P(Heads) on flip #8?

  P(Heads)
  on next ↑
  flip    │
          │  ██████████████████████████  ← True P(Heads) = 50%
   50%  ──┼──██████████████████████████──────────────────────
          │  ██████████████████████████
          │
          │  ████████████  ← Gambler's perceived P(Heads)
   25%  ──┼──████████████   after 7 consecutive Heads ≈ 15%
          │  ████████████   ("tails is due!")
          │  ████████████
   15%  ──┼──████████████
          │  ████████████
    0%  ──┴──────────────────────────────────────────────────
              True         Gambler's
            P(Heads)       Belief

  Reality: Each flip is INDEPENDENT. The coin has no memory.
  P(Heads on flip 8) = 0.50 regardless of prior outcomes.
```

| | Description |
|---|---|
| **What the figure shows** | A graph of the perceived probability of tails on the next coin flip, as a function of the number of consecutive heads observed. The actual probability (50%) is flat across all prior outcomes. The perceived probability rises steeply with consecutive heads, reaching 70–80% after five consecutive heads. |
| **How to interpret it** | The gap between the flat line (actual probability) and the rising line (perceived probability) is the gambler's fallacy. People believe the coin is "due" to come up tails, when in fact its behaviour is independent of prior outcomes. |

It is worth distinguishing the gambler's fallacy from the **hot hand fallacy**, which is its opposite: the belief that success in sports follows streaks (a player who has made three shots in a row is "on fire" and will continue to succeed). The hot hand fallacy reflects representativeness too, but in the opposite direction — runs of success are seen as signal of underlying skill rather than as a sequence that "needs" correcting. Gillovich, Vallone, and Tversky (1985) famously argued that the hot hand in basketball was a fallacy; subsequent research has found mixed evidence. The key point is that representativeness drives both beliefs — the question is whether the underlying process is independent (coins, lotteries) or potentially serially correlated (human performance, which can involve genuine momentum or fatigue effects).

---

## 3. The Availability Heuristic

### 3.1 What It Is and Why We Use It

The **availability heuristic** is the tendency to judge the frequency or probability of events by **how easily examples come to mind**. If relevant examples can be recalled quickly and effortlessly, an event seems common and likely. If examples are difficult to retrieve, the event seems rare.

Tversky and Kahneman (1973) coined the term in a classic paper that also identified one of its clearest manifestations: people's judgements of which events are more common are systematically influenced by how cognitively accessible the events are, not only by how actually frequent they are.

**A Simple Demonstration.** Tversky and Kahneman asked participants whether the English language contains more words beginning with the letter K or more words with K as the third letter. Most people say "beginning with K." The correct answer is the third letter position — there are roughly three times as many words with K in third position (skate, like, take, cake...) as there are words beginning with K (king, kid, kiss...). Words beginning with K are simply much easier to retrieve from memory, because we typically organise our mental lexicon by first letter.

The availability heuristic works because availability is genuinely correlated with frequency in many natural environments. Events that happen often do tend to be easier to recall, all else equal. But availability is also affected by vividness, recency, emotional salience, and media coverage — factors that can make rare events highly available and common events cognitively invisible.

---

### 3.2 Risk Perception and the Availability of Fear

Perhaps the most economically consequential application of the availability heuristic is in risk perception. Studies consistently show that people's assessments of how dangerous various causes of death are bear little relation to actual mortality data, but strong relation to how vivid and media-salient each cause is.

Consider the following pairs of causes of death in the United States, with actual annual fatality counts from the Centers for Disease Control:

**Table 2.2: Perceived vs Actual Cause-of-Death Rankings (United States)**

| Cause of Death | Actual Annual Deaths | Perceived Risk Ranking | Actual Risk Ranking |
|---|---|---|---|
| Shark attacks | ~6 | Very high | Extremely low |
| Falling out of bed | ~450 | Very low | Moderate |
| Airplane crashes | ~100–200 | Very high | Very low |
| Car crashes per km | 1.37 per 100M km | Low | High |
| Tornadoes | ~70 | High | Low |
| Bee and wasp stings | ~62 | Low | Low |
| Deer-vehicle collisions | ~130 | Low | Moderate |
| Lightning strikes | ~50 | Moderate | Very low |

Shark attacks and airplane crashes receive intense media coverage when they occur; they are vivid, dramatic, and emotionally arousing. Bed falls and bee stings occur frequently but quietly, without attracting headlines. The result: perceived risk is systematically higher for dramatic-but-rare events and lower for mundane-but-common ones.

This misperception has real economic consequences:

- **Insurance demand.** People over-insure against risks that are salient (tornados, earthquakes in the aftermath of a disaster) and under-insure against risks that are less vivid. Kunreuther and colleagues have documented that earthquake insurance take-up rates rise sharply after an earthquake and fall back toward pre-event levels within two years — not because the geological risk has changed, but because the perceived risk has tracked availability.

- **Regulatory response.** Public pressure on regulators is driven partly by fear, which is driven by availability. Regulatory resources — inspection dollars, legal penalties — are often directed toward salient but low-probability risks and away from mundane high-probability ones. Viscusi (1993) documented that US regulatory agencies spend vastly different amounts per life saved across programmes, reflecting political salience rather than actuarial analysis.

- **Portfolio allocation.** Investors allocate more to asset classes that have recently performed dramatically (either well or poorly), because recent events are highly available. This generates return-chasing behaviour — buying after gains and selling after losses — that reduces long-run investment returns.

---

### 3.3 Availability Cascades

The interaction of the availability heuristic with mass media and social communication can produce **availability cascades**: self-reinforcing cycles in which a minor event becomes the subject of intense media coverage, which makes it more cognitively available, which increases public concern, which attracts more media coverage, which further amplifies public concern.

Kuran and Sunstein (1999) developed the formal theory of availability cascades. The mechanism involves two components: a **probability cascade** (the event's perceived probability rises because of availability) and an **value cascade** (the perceived seriousness of the event rises because more attention implies more importance). Together, these can produce policy responses wildly disproportionate to the actual risk.

> **Box 2.1: The Alar Pesticide Scare — A Cascade in Action**
>
> In February 1989, the CBS news programme *60 Minutes* reported that Alar, a growth-regulating chemical used on apples, was "the most potent cancer-causing agent in the food supply." The Natural Resources Defense Council released a report claiming it posed a "significant risk" to children.
>
> The story ignited a media firestorm. Within weeks, apple sales collapsed by 25%. Schools across the United States banned apples from cafeterias. Parents in some cities threw away apple juice. The apple industry suffered estimated losses of $375 million.
>
> The scientific assessment was very different. The EPA's risk estimate — which was disputed by multiple independent scientific bodies — was based on extrapolations from extremely high doses in rodents. Documented human deaths from Alar: zero. The National Academy of Sciences and the American Medical Association both concluded that the health risk from normal apple consumption was negligible.
>
> Contrast this with **residential radon exposure**. Radon seeping from the ground into basements is the second leading cause of lung cancer in the United States and Canada, killing approximately 21,000 Americans and over 3,000 Canadians per year. It has received very little media coverage and generates almost no public alarm. The risk is real, large, and largely invisible — because it is not available.
>
> The economic lesson: regulatory and consumer attention is driven by the availability of mental representations, not by expected harm. Markets and governments that respond to availability rather than to actuarial risk systematically misallocate resources.

---

### 3.4 The Availability Heuristic in Financial Decision-Making

Availability operates powerfully in financial markets. Barber and Odean (2008) documented that individual investors are disproportionately likely to purchase stocks that have recently been in the news — regardless of whether the news was positive or negative. The reason: news makes a stock cognitively available, and people buy what they can easily think of. Professional fund managers, with access to systematic portfolio tools, are less subject to this effect.

The broader pattern is sometimes called **recency bias**: the tendency to overweight recent observations relative to older ones in forming expectations. If the stock market has risen for three years, recency bias drives expectations of continued gains — even when the historical base rate of multi-year bull markets suggests caution. If a recession has just ended, the vivid memory of the downturn leads forecasters to underestimate recovery speed.

The 2007-08 global financial crisis provides a sobering illustration. For the decade preceding the crisis, the US housing market had not experienced a nationwide nominal price decline since the 1930s. This made the scenario of a national housing price decline not merely unlikely in most analysts' assessments — it was cognitively nearly unavailable. Models built on historical data literally could not represent it as a realistic scenario. The combination of availability bias (underweighting the unavailable catastrophic scenario) and overconfidence (in models built on that historically narrow dataset) contributed to the underpricing of risk across the financial system.

---

## 4. The Anchoring and Adjustment Heuristic

### 4.1 The Mechanism

When making numerical estimates under uncertainty, people often begin from an initial value — an **anchor** — and then adjust from that value toward what they believe to be the correct answer. The adjustment process, however, is systematically **insufficient**: people do not move far enough from the anchor. The final estimate is biased in the direction of the starting point, even when that starting point is arbitrary and irrelevant.

Tversky and Kahneman (1974) demonstrated this in a classic experiment. Participants watched a wheel of fortune that was rigged to stop at either 10 or 65. They were then asked to estimate the percentage of African nations that are members of the United Nations. The median estimate for the group that saw the wheel land on 10 was 25%. The median estimate for the group that saw it land on 65 was 45%. A completely irrelevant, randomly generated number shifted estimates by 20 percentage points.

The finding that anchoring occurs even when the anchor is explicitly random — when subjects know the number has no informational value — is particularly striking. If anchoring reflected a reasonable inference from informative starting points, it would be perfectly rational. The irrational component is that the adjustment process fails to fully discard the irrelevant anchor.

**What produces insufficient adjustment?** Several mechanisms have been proposed:

- **Cognitive anchoring:** The anchor activates numerically proximate concepts in memory, biasing the retrieval of information that is used to compute the estimate.
- **Confirmatory hypothesis testing:** People search for evidence consistent with the anchor value being correct, rather than evidence against it. This asymmetric search produces anchored final estimates.
- **Satisficing the adjustment process:** Adjustment requires cognitive effort. People stop adjusting when they reach the first value that seems plausible — which, if started near the anchor, is likely to still be near the anchor.

### 4.2 Anchoring in Real Economic Decisions

The anchoring effect extends far beyond artificial laboratory demonstrations. It has been documented in some of the most consequential economic decisions people make.

**Real estate valuation.** Northcraft and Neale (1987) recruited experienced real estate agents in Tucson, Arizona, and showed them the same property. All agents received the same detailed information about the property: its description, neighbourhood comparables, and inspection reports. The only information that varied was the stated listing price. Agents who saw a lower listing price gave substantially lower valuations; those who saw a higher listing price gave substantially higher valuations — with a spread of up to 11% across groups. When asked, the agents explicitly denied that the listing price had influenced their independent assessments. This is consistent with anchoring: the effect operates below the level of conscious awareness.

In consumer real estate markets, the listing price sets an anchor from which both buyers and sellers adjust. Research by Ariely, Loewenstein, and Prelec (2003) — using a procedure they called **arbitrary coherence** — found that once consumers were anchored to a price, their subsequent willingness to pay for a range of products was internally consistent (they had a coherent preference ordering) but anchored to the arbitrary starting point.

**Salary negotiation.** Perhaps the most personally significant anchoring context for most people is salary negotiation. Galinsky and Mussweiler (2001) conducted a series of negotiation experiments and found that the first offer made in a negotiation acts as a powerful anchor on the final settlement. More importantly, who makes the first offer matters: the party that anchors first secures a better outcome, on average, by approximately 10–15%. This finding has been replicated in studies of legal settlements, real estate transactions, and labour negotiations.

The strategic implication is clear: in any negotiation, making a well-researched but favourable first offer is advantageous. The party that waits for the other side to open loses the anchoring advantage. At the same time, counter-moves should involve active counter-anchoring — explicitly rejecting the opening anchor and proposing a very different number — rather than merely adjusting from the other party's starting point.

> **Box 2.2: Anchoring and the Law — A Disturbing Example**
>
> Englich, Mussweiler, and Strack (2006) studied whether legally irrelevant anchors could influence professional judges' sentencing decisions. They conducted experiments with experienced German judges who were asked to sentence a hypothetical shoplifter. Before determining the sentence, half the judges rolled a die that was rigged to produce either 3 or 9. Judges who rolled 3 recommended an average sentence of approximately 5 months. Judges who rolled 9 recommended approximately 8 months — a 50% difference, attributable entirely to a random number the judges knew to be irrelevant.
>
> A subsequent study by the same researchers showed that even experienced judges were influenced by the prosecutor's sentencing request, an anchor that could plausibly be argued is relevant information, but which in the experimental setting was randomly varied. The judges who received a higher requested sentence consistently imposed longer sentences, even when controlling for case characteristics.
>
> These findings are disturbing because they suggest that the length of a prison sentence — one of the most consequential decisions a society makes — may be partly determined by irrelevant starting-point values that the decision-maker consciously rejects as irrelevant, but that the anchoring mechanism nonetheless incorporates.

**Retail pricing and sales anchors.** The anchoring effect is systematically exploited in retail environments. Consider the common marketing practice of displaying a "compare at" price — "Was $200, now $79." The $200 anchor is often not a price at which the product was ever sold, or at which anyone ever seriously proposed selling it. Its function is purely to make $79 seem like a bargain by comparison. Retailers have developed sophisticated variants of this practice: displaying a high-priced decoy item next to a moderately priced target item (the decoy makes the target seem affordable by comparison), or offering three subscription tiers where the middle tier is designed to be the most purchased by serving as the anchor between an obviously inadequate low option and an obviously extravagant high one.

**Table 2.3: Anchoring Effects in Economic Contexts**

| Context | Anchor | Effect | Evidence |
|---|---|---|---|
| Real estate | Listing price | Shifts independent valuations by up to 11% | Northcraft & Neale (1987) |
| Salary negotiation | First offer | First-mover earns 10–15% more | Galinsky & Mussweiler (2001) |
| Legal sentencing | Random die roll | 50% difference in recommended sentences | Englich et al. (2006) |
| Wine valuation | Arbitrary price comparison | Factor of 3–4 difference in willingness to pay | Ariely et al. (2003) |
| Population estimates | Random number (10 vs 65) | 20 percentage point difference in estimates | Tversky & Kahneman (1974) |
| African UN members | Wheel of fortune | Estimates shift from 25% to 45% | Tversky & Kahneman (1974) |

---

## 5. Confirmation Bias

### 5.1 The Mechanism

**Confirmation bias** is the tendency to search for, interpret, favour, and recall information in a way that **confirms our pre-existing beliefs or hypotheses**, while giving disproportionately less weight to information that contradicts them.

This is perhaps the most pervasive and consequential of the cognitive biases discussed in this chapter. It operates at multiple stages of the belief formation process:

- **Search bias:** We look for information in places that are likely to provide confirming evidence, and avoid looking in places where disconfirmation is more probable.
- **Interpretation bias:** When ambiguous evidence arrives, we interpret it as consistent with our prior beliefs.
- **Memory bias:** We recall confirming episodes more readily than disconfirming ones, which reinforces our beliefs even when our actual experience was more mixed.
- **Evaluation bias:** We scrutinise disconfirming evidence more carefully, looking for methodological flaws, while accepting confirming evidence without the same scrutiny.

Confirmation bias is not the same as stubbornness or closed-mindedness. It operates at a level below conscious deliberation in many cases. People who are genuinely trying to evaluate evidence objectively still exhibit confirmation bias in laboratory settings, suggesting that the problem is partly structural to how human cognition processes information.

### 5.2 The Wason Selection Task

The clearest experimental demonstration of confirmation bias is the **Wason selection task**, designed by psychologist Peter Wason in 1960.

**The Problem.** You are shown four cards. Each card has a letter on one side and a number on the other. The four visible faces show: **E**, **K**, **4**, **7**. You are told that a rule governs these cards: "If a card has an E on one side, it has a 4 on the other." Which cards must you turn over to test whether this rule is true or false?

Take a moment to think about this before reading on.

The correct answer is **E and 7**.

- **E** must be turned over: if it has anything other than 4 on the back, the rule is violated. This is the direct confirming/disconfirming test.
- **7** must be turned over: if 7 has E on its back, the rule is violated (E without 4). This is the critical disconfirming test.
- **K** does not need to be turned over: the rule says nothing about what should be on the other side of a K card.
- **4** does not need to be turned over: even if it has E on the other side, this confirms the rule, but finding no E on the back would not violate it (the rule doesn't say all 4s have E on the other side).

Yet most people — approximately 75–90% across studies — choose **E and 4**. They look for cards that could confirm the rule (E and 4) rather than cards that could falsify it. The 7 card — which is the *only* card that can definitively show the rule is wrong — is chosen by fewer than 20% of participants in most studies.

This is confirmation bias in its purest form: people test hypotheses by looking for confirming evidence and systematically overlook the search for disconfirmation, even when disconfirmation is what would provide the most decisive evidence.

Wason (1960) also found that performance on the task improved dramatically when it was reframed in social contexts. People solve the equivalent task very easily when it is stated as: "You are a bouncer. The rule is: anyone drinking alcohol must be over 18. You see four people: one drinking beer, one drinking Coke, one showing an ID saying they are 25, one showing an ID saying they are 16. Who do you need to check?" Almost everyone correctly identifies "beer drinker" and "16-year-old" — the equivalent of E and 7 in the abstract version.

The implication is that confirmation bias is partly a function of the unfamiliarity of abstract reasoning about disconfirmation, not an absolute cognitive incapacity. In familiar social-enforcement contexts, the logic of falsification comes naturally.

### 5.3 Confirmation Bias in Economic Settings

**Financial markets.** Investors who hold a position in a stock selectively process news about that stock. Positive news is absorbed as confirming their investment thesis; negative news is dismissed as temporary or explained away. Lord, Ross, and Lepper (1979) showed that participants who were given the same mixed evidence — studies both supporting and contradicting a position — came away with stronger versions of their original belief. The confirming evidence strengthened their prior; the disconfirming evidence was discounted as methodologically weak.

In financial markets, this means that investors in a losing position tend to find reasons to hold on longer than is optimal — not because they have genuinely re-evaluated the fundamentals, but because confirmation bias makes them selectively weight evidence consistent with the investment recovering. This contributes to the **disposition effect** (discussed in Chapter 3): the tendency to hold losers too long.

**Political polarisation.** One of the most socially consequential applications of confirmation bias is political belief formation. As individuals select their information sources — news channels, social media feeds, peer groups — they are typically selecting sources that are more likely to confirm their existing views. The result is epistemic sorting: populations of people who have been exposed to largely confirming information develop increasingly confident and extreme versions of their initial beliefs. Experimental evidence by Sunstein, Vermeule, and others shows that deliberation among like-minded people does not produce convergence on the facts but rather **group polarisation**: individuals move toward more extreme positions after discussion with others who share their initial view.

**Corporate strategy.** Confirmation bias poses serious risks in strategic decision-making within firms. CEOs who have championed a particular initiative have a strong psychological incentive to interpret incoming data as confirming its effectiveness. The phenomenon of **escalation of commitment** — continuing to pour resources into failing projects because the prior investment (and the beliefs that justified it) make abandonment feel inconsistent — is partly driven by confirmation bias. The sunk cost fallacy (continuing a project because of unrecoverable past costs) may be partly a manifestation of the same mechanism.

> **Box 2.3: The Lord, Ross, and Lepper Experiment**
>
> In a 1979 study, Charles Lord, Lee Ross, and Mark Lepper recruited participants who held strong prior opinions about the deterrent effect of the death penalty — some strongly for, some strongly against. Both groups then read two purported research studies. One study supported the deterrent hypothesis; the other contradicted it. Both studies were real (or real-appearing), and the quality of evidence was held constant across conditions.
>
> The result: both groups came away from the same mixed evidence more confident in their initial position than before reading the studies. Pro-deterrence participants found the pro-deterrence study persuasive and methodologically sound, and the anti-deterrence study biased and flawed. Anti-deterrence participants showed the exact opposite pattern.
>
> The same mixed evidence strengthened both opposing views simultaneously. This is the signature of confirmation bias at scale: information that is objectively mixed becomes, in the presence of prior beliefs, a source of increasing polarisation rather than convergence.

---

## 6. Overconfidence

### 6.1 Three Faces of Overconfidence

Overconfidence is not a single phenomenon but a family of related biases involving the overestimation of one's own abilities, accuracy, or standing relative to others. Moore and Healy (2008) distinguish three forms, each with distinct economic consequences.

**Form 1: Overestimation.** Overestimating one's absolute level of performance or skill. In one study, students who had just taken an exam predicted they had answered 72% of questions correctly; the actual average was 67%. The bias is more pronounced for difficult tasks and less pronounced (sometimes reversing) for easy tasks.

**Form 2: Overplacement (the Better-Than-Average Effect).** Believing one's performance is better than that of one's peers, even when objective comparisons are available. Svenson (1981) surveyed American drivers about their relative skill: 93% rated themselves as above-average drivers. By definition, at most 50% can be above the median. The same pattern has been documented for:
- Teaching quality (94% of professors at one US university rated themselves above average; Cross, 1977)
- Management ability
- Ethical standards
- Driving skill in France (84% above average), Sweden (69%), and Australia (80%)

Interestingly, the better-than-average effect can reverse for difficult tasks. For tasks where most people perform poorly, people are more likely to believe they are below average — because the task is hard, and they have limited basis for evaluating their own relative performance. This suggests the effect is partly about the availability of self-evaluative information, not just a desire to feel good.

**Form 3: Overprecision.** Holding beliefs with too much certainty — having confidence intervals that are too narrow. Graham and Harvey (2003) surveyed Chief Financial Officers quarterly and asked them for 80% confidence intervals for the S&P 500 return over the coming year. The actual return fell within their stated 80% confidence interval only 33% of the time — well below the 80% it should have if their intervals were calibrated. Finance professionals who are paid to forecast markets are, on average, dramatically overconfident in the precision of their forecasts.

Calibration studies show this is pervasive across professions. Physicians overestimate the precision of their diagnoses; meteorologists are among the best-calibrated forecasters (they receive daily feedback), while long-range economic forecasters are among the worst.

### 6.2 The Dunning-Kruger Effect

An important refinement of the better-than-average effect was documented by Kruger and Dunning (1999) in one of the most replicated findings in psychology. Their paper examined whether people at different levels of competence differ in how well-calibrated their self-assessments are.

Their central finding: people with low competence in a domain tend to *most severely overestimate* their ability. People with high competence tend to *slightly underestimate* their ability relative to others. This produces a systematic pattern: the least capable are simultaneously the least able to recognise their own limitations — because the same skills that are needed to perform well in a domain are needed to recognise poor performance in that domain.

Kruger and Dunning tested this across four domains: humour, logical reasoning, grammar, and chess. In each case, participants in the bottom quartile of performance rated their own performance, on average, in approximately the 60th percentile. Participants in the top quartile rated themselves at about the 70th percentile — an underestimate of their actual 85th-percentile performance.

The mechanism is sometimes described as "you don't know what you don't know": the cognitive tools needed to identify one's errors are not available to those who lack the underlying competence. As Bertrand Russell observed — in a statement that predates the Dunning-Kruger research by several decades — "The trouble with the world is that the stupid are cocksure and the intelligent are full of doubt."

**Figure 2.3: The Dunning-Kruger Curve**

```
Perceived ↑
Skill /   │
Confidence│          ★ "Mount Stupid"
          │         /  Peak Overconfidence
   High   ┤        /  \
          │       /    \
          │      /      \                        ●●● Expert
          │     /        \                  ●●●      Plateau
  Medium  ┤    /          \           ●●●
          │   /            \     ●●●   ← Rising with real mastery
          │  /              ●●●
          │ /       "Valley of Despair"
   Low    ┤●  ← Beginners:   (Humility returns as you
          │   some humility   realise what you don't know)
          │
     0    ┼──────────────────────────────────────────────→
          │  Beginner    ◄──────── Actual Competence ─────► Expert
          │
          │   ZONE 1       ZONE 2      ZONE 3      ZONE 4
          │  Beginners   Peak Over-   Valley of    Expert
          │  (low skill,  confidence  Despair     Plateau
          │  some doubt)  "I get it!" (humility)  (accurate)

  - - - - Dashed 45° line = Perfect calibration (actual = perceived)
  ─────── Actual Dunning-Kruger curve (lies above for low skill)
```

| | Description |
|---|---|
| **What the figure shows** | A graph with actual competence on the horizontal axis and perceived competence on the vertical axis. A dashed 45-degree line represents perfect calibration. The actual curve shows that low-competence individuals (left side) perceive themselves as substantially above actual competence (the curve lies well above the dashed line). As actual competence rises, perceived competence initially falls relative to actual ("Valley of Despair"), then rises again for the most skilled individuals. The most competent slightly underestimate their relative standing. |
| **How to interpret it** | The pattern creates a striking paradox: the people who are most mistaken about their own ability are exactly those who are most confident. This has implications for hiring, delegation, and any setting in which people's self-assessments are used as inputs to decisions. |

**Economic applications of the Dunning-Kruger effect:**

- **Entrepreneurship.** A large fraction of new businesses fail within five years — estimates range from 50–90% depending on the industry and time horizon. Yet surveys of new business owners consistently show wildly optimistic assessments: most believe their chances of success are 70–90%, despite knowing that the base rate of survival is much lower. Camerer and Lovallo (1999) showed that this optimism drives excess entry into competitive markets — more firms enter than the market can sustain, because each entrant believes it is in the top half of the quality distribution.
- **Financial literacy.** Lusardi and Mitchell (2014) documented that in many countries, financial literacy is low but self-assessed financial knowledge is high. Canadians who score poorly on objective financial literacy tests often rate their own financial knowledge as "good" or "very good." This discrepancy has practical consequences: people with low actual literacy and high self-assessed literacy are less likely to seek advice, more likely to make poor financial decisions, and less likely to benefit from financial education programmes.

### 6.3 The Planning Fallacy

The **planning fallacy** (Kahneman and Tversky, 1979) is the consistent tendency to underestimate the time, cost, and effort required to complete future tasks, while simultaneously overestimating the benefits those tasks will generate.

The planning fallacy is not merely a result of random estimation error. It reflects a systematic cognitive pattern: when people plan, they focus on the **inside view** — how this particular project will unfold, the specific steps involved, the expected sequence of events. They underweight the **outside view** — what actually happened when similar projects were attempted in the past.

Historical data on large projects are sobering:
- The Sydney Opera House was budgeted at $7 million in 1957 and completed at a cost of $102 million — fourteen times the estimate.
- The Montreal Olympic Stadium was designed at $120 million and cost $1.6 billion; the debt was finally paid off in 2006, thirty years after the 1976 Games.
- Denver International Airport opened 16 months late and approximately $2 billion over budget.
- The F-35 fighter jet programme in the US exceeded its original cost estimate by over $160 billion.
- IT projects are estimated to overrun their budgets by an average of 27%, with many dramatically larger overruns (Flyvbjerg et al., 2003).

The planning fallacy affects individual economic decisions too. Students consistently underestimate how long assignments will take. Homeowners underestimate renovation costs and timelines. Job seekers overestimate how quickly they will find employment. Dieting and exercise plans are abandoned at rates far higher than their originators projected.

The economic insight is that planning fallacy-driven decisions systematically underprice the true cost and timeline of projects. This produces underinvestment in contingency reserves, over-commitment of resources in the early stages of projects, and an excess of started-but-not-completed initiatives relative to the socially optimal allocation.

---

### 6.4 Overconfidence in Financial Markets

> **Research Study: Boys Will Be Boys — Gender, Overconfidence, and Investment Returns**
>
> **Researchers:** Brad Barber and Terrance Odean
> **Year:** 2001
> **Research Question:** Does overconfidence lead investors to trade excessively and earn lower returns?
> **Method:** Barber and Odean analysed the trading records of 35,000 households at a major US discount brokerage over the period 1991–1997. They used trading frequency as a behavioural signature of overconfidence (the argument being that investors who trade more are likely doing so because they believe their information is more valuable than it actually is). They split the sample by gender, reasoning from the psychology literature that men exhibit higher overconfidence than women in financial domains.
> **Results:** Men traded 45% more than women. The average household lost 1.1% of annual net return from trading (relative to a buy-and-hold strategy), due to transaction costs and taxes on capital gains. Male investors lost 2.65%; female investors lost 1.72%. The most active trading quintile underperformed the least active quintile by 7.1% annually. The conclusion: more trading is associated with lower returns, and overconfident investors trade more.
> **Economic Interpretation:** The evidence is consistent with the thesis that overconfidence leads investors to believe their private information and analytical ability justifies frequent portfolio changes, when in fact the transactions generate costs without improving performance. The stock market aggregates the trades of many investors; overconfident investors effectively subsidise the returns of patient investors by generating high volumes of value-destroying trades.
> **Behavioural Insight:** The gender difference in trading frequency and its correlation with returns is not an argument that women are better investors in any deep sense — rather, it suggests that lower overconfidence in one's own trading ability leads to more conservative, and in this context more profitable, behaviour.

---

## 7. How Heuristics Interact

The five heuristics discussed in this chapter do not operate independently. They interact and amplify each other in ways that can produce compounding errors.

**Table 2.4: Summary of Heuristics, Mechanisms, and Key Biases**

| Heuristic | Core Question Replaced | Principal Bias | Key Example |
|---|---|---|---|
| Representativeness | "How likely is A?" → "How much does A resemble the prototype?" | Base rate neglect, conjunction fallacy, gambler's fallacy | Linda the bank teller; medical diagnosis |
| Availability | "How frequent is A?" → "How easily can I recall A?" | Risk misperception, recency bias, availability cascades | Sharks vs. bed falls; Alar scare |
| Anchoring and Adjustment | "What is the right number?" → "How should I adjust from X?" | Insufficient adjustment, arbitrary price acceptance | Salary negotiations; legal sentences |
| Confirmation Bias | "Is my belief correct?" → "Does this support my belief?" | Belief perseverance, polarisation, escalation of commitment | Wason task; investment losses |
| Overconfidence | "How accurate am I?" → "I am quite accurate" | Excess trading, planning fallacy, bad calibration | Barber & Odean; Montreal Olympics |

**Overconfidence and confirmation bias** combine naturally: being overconfident in one's beliefs reduces the motivation to search for disconfirming evidence. Confirmation bias ensures that any search that is conducted yields mostly confirming findings, reinforcing overconfidence. This feedback loop is particularly dangerous in financial and business settings, where consequential decisions rest on subjective assessments.

**Representativeness and availability** amplify each other in risk perception: dramatic events are both vivid (highly available) and stereotypically "disaster-like" (high in representativeness of the category "catastrophe"). Both mechanisms simultaneously inflate the perceived probability of dramatic-but-rare events.

**Anchoring and confirmation bias** interact in evaluations of evidence. Once an initial estimate is formed (anchoring), confirmation bias ensures that subsequent evidence is interpreted as consistent with that estimate. The combination produces highly sticky beliefs that are resistant to correction even when contradictory evidence is abundant.

**Application: Medical Diagnosis.** The interaction of heuristics is well-illustrated in the domain of medical diagnosis, where multiple biases contribute to diagnostic error:

- **Anchoring:** The first diagnosis considered tends to anchor subsequent interpretation. Once a physician has hypothesised "viral infection," subsequent symptoms that are ambiguous are interpreted as consistent with that hypothesis.
- **Confirmation bias:** The physician seeks tests that will confirm the leading hypothesis rather than tests designed to falsify it — a pattern called "premature closure" in the medical literature.
- **Availability:** A physician who recently treated an unusual case may over-diagnose subsequent similar presentations as that unusual condition — "thinking in zebras" when horses are more likely.
- **Representativeness:** A patient whose symptoms are typical of a condition is more readily diagnosed correctly; a patient whose presentation is atypical (due to age, comorbidities, or unusual symptom combinations) may be missed.
- **Overconfidence:** Experienced physicians, particularly specialists, may be more subject to overconfidence than less experienced clinicians — because experience increases both actual competence and subjective certainty, but subjective certainty tends to outrun actual competence.

Structured checklists and protocols — of the kind documented by surgeon Atul Gawande in *The Checklist Manifesto* (2009) — have been shown to reduce diagnostic error rates substantially, partly by requiring physicians to explicitly consider alternative diagnoses (countering anchoring and confirmation bias) and to follow a structured sequence rather than relying on intuitive pattern recognition (reducing availability effects). The Canadian Patient Safety Institute adopted structured diagnostic protocols in its 2018 guidelines, with documented improvements in diagnostic accuracy.

---

## 8. Are Heuristics Irrational? The Gigerenzer Debate

No discussion of heuristics would be complete without acknowledging the important alternative perspective developed by Gerd Gigerenzer and colleagues at the Max Planck Institute for Human Development. Gigerenzer has argued, in a series of papers and books, that the Kahneman-Tversky programme systematically mischaracterises heuristics as cognitive failures when they are, in fact, **ecologically rational** — well-adapted strategies that achieve good outcomes in the environments in which they are deployed.

**The Ecological Rationality Argument.** Gigerenzer argues that a heuristic should not be judged as biased simply because it violates the axioms of probability theory or expected utility theory in the abstract. The relevant criterion is whether the heuristic works well *in the real environments in which humans actually make decisions*. A heuristic that sacrifices theoretical optimality but achieves good results in realistic environments — where information is incomplete, time is limited, and the future is genuinely uncertain — may be better than an optimal algorithm that requires information and computation unavailable in practice.

**The "Less is More" Principle.** Gigerenzer and Goldstein (1999) demonstrated a striking result: in many prediction tasks involving noisy real-world data, simple heuristics that use only one or two pieces of information outperform complex statistical models that use all available data. Their "take-the-best" heuristic — which simply ranks cues by validity and chooses based on the first cue that discriminates between options — outperformed multiple regression, logistic regression, and other sophisticated statistical methods in out-of-sample prediction across dozens of real-world datasets.

The intuition is that complex models are more susceptible to **overfitting**: they capture idiosyncrasies of the training data that do not generalise to new data. Simple models generalise better because they are less sensitive to noise. In an uncertain world with limited data, simplicity can be a virtue.

**Frequency Formats.** Gigerenzer and Hoffrage (1995) showed that base rate neglect largely disappears when problems are presented in terms of natural frequencies rather than probabilities. Recall the medical test problem: when stated as "1 in 1,000 people has the disease; the test gives a false positive 1% of the time; if you test 1,000 people, how many of the positive-testers actually have the disease?", most people reason correctly. This suggests that base rate neglect is not a deep cognitive limitation but an artefact of an unnatural problem format — and that human cognition is actually well-adapted to handle frequency-format information, because that is the form in which information naturally arrives in everyday experience.

**The Kahneman-Gigerenzer Debate.** This exchange between two of the most prominent figures in the study of human judgement has been one of the most productive in the social sciences. The key points of disagreement:

- **Kahneman and Tversky** argue that heuristics produce systematic errors that are stable across contexts, including real-world contexts, and that these errors have demonstrably costly economic consequences.
- **Gigerenzer** argues that the laboratory tasks used by Kahneman and Tversky are unrepresentative of real environments and use unnatural problem formats (probability statements, rather than frequencies). In real environments, he claims, simple heuristics work well.

The accumulated evidence suggests that both views capture something true:

1. Heuristics do produce systematic, predictable errors in many real economic contexts — the anchoring evidence in real estate, salary negotiation, and legal sentencing is not merely a laboratory phenomenon.
2. In other domains — particularly prediction tasks with noisy, limited data — simple heuristics can match or outperform complex models.
3. Problem format matters: how information is presented shapes which cognitive processes are engaged and can mitigate or exacerbate bias.

For economists, the practical implication is that heuristics are neither universally good nor universally bad. They require evaluation in context: when is the simple rule likely to work well, and when is the structured, analytic approach worth the additional cognitive investment?

---

## 9. Can We Reduce Bias? De-biasing Strategies

If heuristics produce predictable errors, can those errors be corrected? The answer is: sometimes, partially, and it is difficult.

**Training and Education.** Providing people with statistical education does not reliably eliminate base rate neglect or the conjunction fallacy. Tversky and Kahneman documented the conjunction fallacy in samples of graduate students in decision science — people who were intimately familiar with the relevant probability theory. The failure mode is not ignorance of the rules; it is that System 1 generates the answer before System 2 can apply the rules.

There is evidence that domain-specific training in statistical reasoning (particularly with frequency formats) can improve performance on some tasks. Nisbett and colleagues (1987) found that graduate training in statistics improved performance on probabilistic reasoning problems outside the statistical domain — suggesting that at least some transfer of reasoning skills occurs.

**"Consider the Opposite."** A powerful and relatively robust de-biasing technique is forcing decision-makers to explicitly generate reasons why their initial assessment might be wrong. Mussweiler, Strack, and Pfeiffer (2000) showed that instructing negotiators to "consider the opposite" — to actively generate reasons why the anchor might be too high or too low — substantially reduced anchoring effects. The same technique has been applied in clinical settings: requiring physicians to explicitly document at least one alternative diagnosis before committing to the primary one reduces premature closure.

**Structured Decision Processes.** Replacing intuitive judgement with structured analytic processes — checklists, scoring rubrics, explicit weighting of criteria — reduces the influence of heuristics. This is the principle underlying the use of scoring algorithms for credit decisions, structured behavioural interviewing for hiring decisions, and diagnostic protocols in medicine. The reduction in bias comes at a cost: structured processes are slower, require more documentation, and may generate resistance from professionals who trust their intuition.

**Reference Class Forecasting.** To counter the planning fallacy, Flyvbjerg (2008) developed **reference class forecasting**: instead of projecting the expected timeline and cost of a project from the inside view (the specific details of this project), planners are required to identify a reference class of similar projects and use the historical distribution of outcomes for that class as the starting point. The UK Treasury has mandated reference class forecasting for major infrastructure projects since 2004, and evidence suggests it reduces cost overruns.

**Red Teams and Adversarial Collaboration.** To counter confirmation bias in organisational decision-making, some organisations designate a team member or small group as a "red team" charged with finding reasons why the proposed strategy will fail. The intelligence community in the United States institutionalised this practice after the failure to anticipate the September 11, 2001 attacks. The practice forces the organisation to engage in active hypothesis testing rather than confirmation-seeking.

The broader lesson is that heuristics cannot be eliminated through willpower or awareness alone. They are deep features of how human cognition works. Effective de-biasing requires changing the **process** of decision-making — the structure, the prompts, the information formats, the checks and reviews — rather than simply telling people to think harder.

---

## 10. Applications

### 10.1 Consumer Behaviour and Marketing

Marketing professionals have long exploited heuristics — often intuitively, and increasingly through systematic behavioural research — to influence consumer decisions.

**Anchoring in retail pricing.** The "was/now" pricing format, the use of a high-priced decoy to make the target price seem reasonable, and the practice of leading with a high price in negotiations all exploit anchoring. Retailers who understand anchoring design their store environments to ensure the first price a consumer sees is the one that frames all subsequent evaluations.

**Availability in advertising.** Effective advertising increases the availability of a product by making it vivid and memorable. A consumer who can easily recall a brand name and an associated positive image is more likely to select that brand, independent of its objective quality. This is one reason that advertising spending and sales are positively correlated even for established products whose features are already well-known to consumers.

**Representativeness in brand positioning.** Brands that carefully match their visual identity, messaging, and product experience to the prototype of their target market benefit from representativeness. A brand that looks like a premium product will be judged more likely to be a premium product, even before the consumer has any direct experience of its quality.

### 10.2 Financial Decision-Making

Heuristics explain several puzzling patterns in household finance:

- **Home bias.** Investors dramatically over-allocate to domestic equities relative to what optimal diversification would predict. Familiarity breeds subjective probability: familiar investments feel safer (availability) and more representative of "safe investment" (representativeness).
- **Return chasing.** Investors move into asset classes that have recently performed well. Last year's winners are highly available and feel representative of future winners, despite the evidence that past performance does not predict future returns.
- **Overconfident trading.** As documented by Barber and Odean, overconfidence leads to excess trading that destroys returns. The average active mutual fund underperforms its benchmark net of fees, consistent with overconfidence among fund managers in the value of their stock-picking ability.

### 10.3 Public Policy and Regulation

Understanding heuristics has important implications for how governments communicate and regulate:

- **Risk communication.** Information about health risks should be presented in natural frequency formats rather than relative risk reductions (to reduce base rate neglect), and should avoid dramatic but unrepresentative anecdotes (which create availability biases).
- **Regulatory priority.** Resource allocation in regulatory agencies should be based on actuarial analysis of expected harm, not on the salience of recent incidents. Post-accident regulatory surges and post-boom regulatory relaxation are both consistent with availability driving the political economy of regulation.
- **Financial disclosure.** Regulatory requirements for disclosure of financial product fees, risks, and past performance exploit the possibility of reducing confirmation bias and availability bias — but only if the disclosures are designed to be salient, concrete, and easy to process (reducing cognitive load on System 2).

---

## Critical Thinking Questions

### Conceptual Questions

1. The availability heuristic uses ease of recall as a proxy for frequency. In what environments is this proxy accurate? In what environments does it systematically mislead? Think about the role of media coverage and emotional salience.

2. Gigerenzer argues that heuristics are "ecologically rational" — adapted to the environments in which humans evolved. Does this argument imply that heuristics should not be corrected? How would you distinguish between an ecologically rational heuristic that produces good outcomes and a bias that produces poor outcomes?

3. The conjunction fallacy (Linda problem) is extremely robust — it occurs even in trained statisticians. What does this tell us about the relationship between knowing a rule of logic and actually applying it in practice?

4. Base rate neglect causes people to overestimate the probability of a positive test result indicating disease when the base rate is low. Yet without any screening at all, diseased individuals are missed entirely. Is some overestimation of diagnostic test results actually useful for promoting health-seeking behaviour?

5. Confirmation bias is often presented as irrational. But can you construct an argument that selective attention to confirming evidence might sometimes be a rational strategy? Think about situations where forming strong, stable beliefs quickly may be important.

6. Decision fatigue implies that the quality of decisions degrades over time within a session. What institutional design choices follow from this insight? Consider courts, hospitals, financial advisors, and hiring committees.

7. The Dunning-Kruger effect suggests that low-competence individuals have the most inaccurate self-assessments. Does this imply that these individuals are "beyond help" through educational interventions? Or does it point toward particular types of feedback that might be effective?

8. Overconfidence in absolute ability (overestimation) and overconfidence in relative standing (overplacement) are distinct phenomena. Can you think of circumstances in which a person might simultaneously underestimate their absolute performance while overestimating their relative standing?

9. The gambler's fallacy predicts that people will believe a long run of heads is "due" to be corrected by tails. But the hot hand fallacy predicts that a successful streak in basketball will be expected to continue. Both are generated by representativeness. What determines which prediction a person makes — "this run is about to end" or "this run will continue"?

10. "Awareness of a bias does not eliminate the bias." If this is true, what is the purpose of teaching behavioural economics? What can students actually do with this knowledge?

### Application Questions

11. You are designing the information architecture for a government website that helps Canadians understand their risk of developing Type 2 diabetes. Using the insights from this chapter, how would you present the statistical risk information to minimise availability bias and base rate neglect?

12. A hiring committee at a firm tends to select candidates whose profile resembles that of the most successful employee in the previous cohort. Which heuristic is operating? What errors might this produce, and what changes to the hiring process would reduce them?

13. A car dealership first shows you a premium model priced at $75,000 before showing you the model you actually intended to buy, priced at $45,000. What heuristic is the salesperson exploiting? Would knowing this protect you from its effect?

14. An investor has held a technology stock for two years and has watched it decline 40%. A financial advisor presents them with a balanced analysis: three reasons the stock might recover and three reasons it might continue to decline. How would confirmation bias predict the investor will process this information?

15. A pharmaceutical company releases a new drug with a "95% success rate." A health journalist reports it differently: "5% of patients experience treatment failure." Assuming the statistics are identical, which framing is likely to produce higher uptake? Which heuristic explains this?

16. A senior executive is planning a new IT system for their firm. Historical data on similar IT projects shows a 60% cost overrun rate and an average time overrun of 40%. How would reference class forecasting change their planning process? What psychological barriers would they face in adopting this approach?

17. A community is debating whether to add fluoride to the local water supply. Opponents produce vivid stories of individual harm; supporters cite population-level epidemiological statistics. Which side is using each heuristic to its advantage? What communication strategy would you recommend to the public health authority?

18. An online retailer offers three subscription plans: Basic ($9.99/month), Standard ($19.99/month), and Premium ($29.99/month). The retailer's goal is to maximise uptake of the Standard plan. What pricing design principle exploits heuristics to achieve this? Which heuristic specifically?

19. A loan officer at a bank has just approved four consecutive loan applications. Behavioural research predicts the officer's fifth decision may be affected by a cognitive bias. Which one? What institution-level policy could address this?

20. You are advising a climate policy communications team. They want to change Canadians' behaviour around home energy use. How would you design a communications campaign that (a) exploits availability to increase perceived urgency, but (b) avoids triggering availability cascades or misrepresenting actual risk?

### Discussion Questions

21. The availability cascade theory (Kuran and Sunstein) suggests that media coverage amplifies perceived risk even when actual risk is unchanged. Does this imply that media coverage of risks is socially harmful? Or are there cases in which an availability cascade produces socially desirable outcomes?

22. De-biasing through process change (checklists, red teams, reference class forecasting) is generally more effective than de-biasing through individual awareness. What does this imply about where responsibility for reducing cognitive bias lies — with individuals, with organisations, or with government?

23. The Wason selection task shows that people seek confirming rather than falsifying evidence. Yet the scientific method is explicitly built around falsification (Popper's criterion). How do scientists manage to practise falsification when it is so cognitively unnatural?

24. Overconfidence leads to excess entry into competitive markets (Camerer and Lovallo, 1999). Does this have a positive externality? Consider whether overconfident entrepreneurs provide social benefits — employment, innovation, experimentation — that partially offset the losses they experience from over-entry.

25. Consider the Kahneman-Gigerenzer debate. Kahneman's research is largely based on laboratory experiments with students; Gigerenzer's research often involves professionals in domain-relevant tasks. Does the setting matter? Should we draw different conclusions about heuristics in lay versus expert populations?

26. In legal systems, judges are expected to discard irrelevant information and reason only from the evidence before them. The anchoring study by Englich and colleagues shows that even professional judges are affected by irrelevant anchors. What institutional reforms follow from this finding? Would you trust sentencing algorithms over human judges?

27. The planning fallacy systematically leads to cost and time overruns in infrastructure projects, which are funded by taxpayers. Should this information change how governments plan and budget for major projects? What political obstacles would a reform face?

28. Confirmation bias can lead investors to hold losing positions too long. But sometimes persistence in a losing position reflects genuinely rational belief updating — the investor has information others do not. How would you distinguish rational persistence from confirmation-bias-driven denial?

29. "Heuristics are not irrational — they are rational responses to an irrational world full of incomplete information and time pressure." Evaluate this claim. Can you construct both a strong defence and a strong critique?

30. If confirmation bias is partly responsible for political polarisation, and if de-biasing through individual awareness is largely ineffective, what institutional or platform-level interventions might reduce the social costs of confirmation bias in political belief formation?

---

## Chapter Summary

This chapter has examined the heuristics — mental shortcuts — that underlie much of the systematic deviation from rational choice documented in Chapter 1. The major themes are:

**Decision Fatigue.** System 2 is depletable. Sustained decision-making depletes the cognitive resource needed for deliberate reasoning, causing people to default to simple rules and status-quo options. The Israeli parole board study demonstrates this with striking clarity: judicial decisions become systematically more conservative as cognitive resources are depleted within a session.

**The Representativeness Heuristic.** People judge probabilities by resemblance to a prototype, ignoring base rates and sample size. This produces: (a) *base rate neglect* — insufficient weighting of prior probabilities, with serious consequences in medical diagnosis and financial forecasting; (b) the *conjunction fallacy* — rating conjunctions as more probable than their components because they are more representative; (c) the *gambler's fallacy* — expecting random sequences to "self-correct" because non-alternating sequences don't look random.

**The Availability Heuristic.** People judge frequency and probability by ease of recall. Events that are vivid, dramatic, and media-salient are overweighted; common but mundane events are underweighted. Availability cascades — self-reinforcing cycles of media coverage and public concern — can produce policy responses wildly disproportionate to actual risk.

**The Anchoring and Adjustment Heuristic.** Numerical estimates are made by adjusting from an initial value, with insufficient adjustment. Arbitrary and irrelevant anchors influence real estate valuations, salary negotiations, legal sentencing, and consumer prices. Anchoring is robust to awareness — people cannot simply decide not to be anchored.

**Confirmation Bias.** People seek, interpret, and recall information in ways that confirm their existing beliefs. The Wason selection task demonstrates that people search for confirming evidence and neglect falsifying evidence even in simple logical problems. In financial markets, this produces belief perseverance in losing investments and polarisation in market sentiment.

**Overconfidence.** Three forms: overestimation (inflating absolute ability), overplacement (better-than-average effect), and overprecision (narrow confidence intervals). The Dunning-Kruger effect shows that the least competent individuals most severely overestimate their ability. Overconfidence in financial markets produces excess trading that destroys returns.

**Interactions.** Heuristics amplify each other. The most consequential economic errors typically involve multiple heuristics reinforcing the same mistaken conclusion. Medical diagnosis, financial market bubbles, and strategic planning failures each represent interactions among representativeness, availability, anchoring, confirmation bias, and overconfidence.

**The Gigerenzer Debate.** Heuristics are not uniformly irrational. In environments with genuine uncertainty and limited information, simple rules can outperform complex algorithms. Problem format matters: frequency presentations reduce base rate neglect. The task for economic analysis is to identify the conditions under which heuristics produce good versus poor outcomes.

**De-biasing.** Awareness of biases is insufficient to eliminate them. Effective de-biasing requires changes in process: structured checklists, "consider the opposite" exercises, reference class forecasting, frequency formats for statistical information, and red teams.

---

## Glossary

**Anchoring and Adjustment.** A heuristic in which people form numerical estimates by starting from an initial value (the anchor) and adjusting, typically insufficiently, toward what they believe to be the correct answer. The anchor influences the final estimate even when it is arbitrary and irrelevant.
*Example:* Judges who roll a higher number on a die before sentencing recommend longer sentences. Real estate agents shown higher listing prices provide higher independent valuations.
*Why it matters:* Affects salary negotiations, legal sentences, real estate markets, and consumer pricing in predictable ways that can be strategically exploited.

**Availability Cascade.** A self-reinforcing cycle in which an event receives intense media coverage, increasing its cognitive availability, which increases public concern, which attracts more coverage. Produces public alarm and regulatory response disproportionate to actual risk.
*Example:* The 1989 Alar pesticide scare: zero documented deaths, $375 million in industry losses. Contrast with radon (3,000+ Canadian deaths per year, minimal public concern).
*Why it matters:* Explains why regulatory and consumer attention is driven by salience rather than expected harm, producing systematic misallocation of resources.

**Availability Heuristic.** A heuristic in which people judge the frequency or probability of events by how easily examples come to mind. Vivid, dramatic, recent, and media-covered events are more available and therefore judged more frequent or likely.
*Example:* Shark attacks are judged far more deadly than they are; falling out of bed is judged far less deadly than it is.
*Why it matters:* Drives misperception of risk across health, finance, and public policy with large economic consequences.

**Base Rate Neglect.** The tendency to underweight or ignore prior probabilities (base rates) when forming probability judgements, focusing instead on the resemblance between the observed evidence and a prototype category.
*Example:* A positive result from a medical test with 1% false-positive rate is judged to imply ~99% probability of disease, when the correct answer (given a 1/1,000 base rate) is ~9%.
*Why it matters:* Produces systematic errors in medical diagnosis, criminal profiling, credit assessment, and any domain requiring probabilistic reasoning about rare events.

**Confirmation Bias.** The tendency to search for, interpret, favour, and recall information in a way that confirms pre-existing beliefs, while discounting information that contradicts them.
*Example:* Investors in a declining stock selectively notice positive news and discount negative news, holding losing positions longer than is rational.
*Why it matters:* Produces belief perseverance in losing positions, political polarisation, and escalation of commitment in failing projects.

**Conjunction Fallacy.** The logical error of rating a conjunction of two events as more probable than either event alone. Violates the probability rule $P(A \cap B) \leq P(A)$.
*Example:* Rating "Linda is a bank teller and a feminist" as more probable than "Linda is a bank teller" after reading a description that resembles a feminist activist.
*Why it matters:* Leads to overconfidence in detailed narratives, excessive premium for explanatory complexity in financial analysis, and errors in legal reasoning.

**Decision Fatigue.** The deterioration in decision quality resulting from cognitive depletion caused by sustained decision-making. As System 2 resources are depleted, people default to simpler rules and status-quo options.
*Example:* Israeli parole judges grant parole at 65% rates at the start of a session; rates fall toward 0% just before food breaks and reset after them.
*Why it matters:* Reveals that decision quality is affected by irrelevant contextual factors — time of day, number of prior decisions — that the standard model ignores.

**De-biasing.** Strategies intended to reduce the influence of cognitive heuristics and biases on decision-making. Effective de-biasing typically requires process change (checklists, red teams, reference class forecasting) rather than individual awareness, which is generally insufficient.
*Example:* Reference class forecasting replaces inside-view project planning with base rates from historical reference classes of similar projects.
*Why it matters:* Establishes the limits of individual self-correction and motivates institutional design to reduce cognitive bias.

**Dunning-Kruger Effect.** The finding that people with low competence in a domain tend to most severely overestimate their ability, because the same skills needed for competent performance are needed to accurately assess one's own performance.
*Example:* Participants in the bottom quartile of a logical reasoning test rate themselves in approximately the 60th percentile.
*Why it matters:* Implies that the individuals most at risk from overconfidence are exactly those least likely to be aware of it or to seek corrective feedback.

**Ecological Rationality.** Gigerenzer's concept that heuristics should be evaluated not against abstract normative standards (probability theory, EUT) but against their performance in the real environments in which they are deployed. A heuristic is ecologically rational if it achieves good outcomes in its target environment.
*Example:* The "take-the-best" heuristic outperforms logistic regression in out-of-sample prediction of mortality in medical data.
*Why it matters:* Challenges the universal classification of heuristics as biases and argues that appropriate evaluation requires attention to the structure of the decision environment.

**Gambler's Fallacy.** The mistaken belief that in a random process, a run of one outcome makes the opposite outcome more likely. Conflates the properties of a sequence (roughly equal numbers of heads and tails over many flips) with the properties of individual trials (each flip is independent).
*Example:* Roulette players bet on black after several consecutive reds; lottery players avoid recently drawn numbers.
*Why it matters:* Affects casino behaviour, lottery participation, loan officers' sequential decisions, and any domain where independent random processes are misinterpreted as self-correcting.

**Heuristic.** A mental shortcut or rule of thumb that allows quick decisions without exhaustive computation. Heuristics are adaptive strategies that work well in many environments but produce systematic errors (biases) in specific circumstances.
*Example:* Using ease of recall to estimate frequency (availability heuristic); using resemblance to estimate probability (representativeness heuristic).
*Why it matters:* The primary cognitive mechanism through which bounded rationality produces systematic, predictable deviations from optimal decision-making.

**Overconfidence.** A family of biases involving overestimation of one's own abilities, accuracy, or standing. Includes overestimation (inflated absolute self-assessment), overplacement (better-than-average effect), and overprecision (confidence intervals that are too narrow).
*Example:* 93% of US drivers rate themselves as above average. Finance professors' 80% confidence intervals for S&P 500 returns contain the actual return only 33% of the time.
*Why it matters:* Drives excess trading (destroying investment returns), excess market entry (producing business failures), planning fallacy (producing cost and time overruns), and poor calibration in expert forecasts.

**Planning Fallacy.** The systematic tendency to underestimate the time, cost, and effort required to complete projects, while overestimating the benefits. Caused by overconfidence and a failure to use outside-view information from reference classes of similar past projects.
*Example:* Sydney Opera House cost 14 times its original budget. Montreal Olympics debt was paid off 30 years after the Games.
*Why it matters:* Produces systematic under-budgeting and under-staffing of projects, requiring expensive mid-project revisions and creating fiscal risks for governments and firms.

**Reference Class Forecasting.** A de-biasing technique for project planning developed by Flyvbjerg (2008), based on Kahneman and Lovallo (1993). Instead of projecting from the specific details of the current project (inside view), planners identify a reference class of similar past projects and use the historical distribution of outcomes as the planning baseline.
*Example:* Mandated by UK Treasury for major infrastructure projects since 2004; associated with reduced cost overruns.
*Why it matters:* Demonstrates a practical, evidence-based method for countering the planning fallacy in high-stakes investment decisions.

**Representativeness Heuristic.** A heuristic in which people judge the probability that an object belongs to a category by how closely it resembles a prototype of that category, ignoring base rates and sample size.
*Example:* Judging that the quiet, puzzle-loving Tom is more likely to be a librarian than a truck driver, ignoring that truck drivers outnumber librarians 20 to 1.
*Why it matters:* Drives base rate neglect, the conjunction fallacy, and the gambler's fallacy — three of the most economically consequential errors in probability judgement.

**Wason Selection Task.** A logical reasoning task designed by Peter Wason (1960) to test for confirmation bias. Participants must select cards to test a conditional rule. Most choose cards that confirm the rule (demonstrating confirmation bias) rather than the cards that would falsify it (the normatively correct choice).
*Example:* Given the rule "If E, then 4" and cards showing E, K, 4, and 7, most people choose E and 4 rather than the correct E and 7.
*Why it matters:* The most widely used demonstration of confirmation bias; shows that the tendency to seek confirming evidence occurs even in simple logical tasks where the correct procedure is easily explained.

---

## References

Ariely, D., Loewenstein, G., & Prelec, D. (2003). "Coherent arbitrariness": Stable demand curves without stable preferences. *Quarterly Journal of Economics*, 118(1), 73–106.

Barber, B. M., & Odean, T. (2001). Boys will be boys: Gender, overconfidence, and common stock investment. *Quarterly Journal of Economics*, 116(1), 261–292.

Barber, B. M., & Odean, T. (2008). All that glitters: The effect of attention and news on the buying behavior of individual and institutional investors. *Review of Financial Studies*, 21(2), 785–818.

Camerer, C. F., & Lovallo, D. (1999). Overconfidence and excess entry: An experimental approach. *American Economic Review*, 89(1), 306–318.

Canadian Patient Safety Institute. (2004). *The Safety of Health Care in Canada: A Report by the National Steering Committee on Patient Safety*. CPSI.

Danziger, S., Levav, J., & Avnaim-Pesso, L. (2011). Extraneous factors in judicial decisions. *Proceedings of the National Academy of Sciences*, 108(17), 6889–6892.

Englich, B., Mussweiler, T., & Strack, F. (2006). Playing dice with criminal sentences: The influence of irrelevant anchors on experts' judicial decision making. *Personality and Social Psychology Bulletin*, 32(2), 188–200.

Flyvbjerg, B. (2008). Curbing optimism bias and strategic misrepresentation in planning: Reference class forecasting in practice. *European Planning Studies*, 16(1), 3–21.

Flyvbjerg, B., Holm, M. S., & Buhl, S. (2003). How common and how large are cost overruns in transport infrastructure projects? *Transport Reviews*, 23(1), 71–88.

Galinsky, A. D., & Mussweiler, T. (2001). First offers as anchors: The role of perspective-taking and negotiator focus. *Journal of Personality and Social Psychology*, 81(4), 657–669.

Gawande, A. (2009). *The Checklist Manifesto: How to Get Things Right*. Metropolitan Books.

Gigerenzen, G., & Goldstein, D. G. (1999). Betting on one good reason: The take-the-best heuristic. In G. Gigerenzer & P. M. Todd (Eds.), *Simple Heuristics That Make Us Smart*. Oxford University Press.

Gigerenzer, G. (2008). *Rationality for Mortals: How People Cope with Uncertainty*. Oxford University Press.

Gigerenzer, G., & Hoffrage, U. (1995). How to improve Bayesian reasoning without instruction: Frequency formats. *Psychological Review*, 102(4), 684–704.

Gilovich, T., Vallone, R., & Tversky, A. (1985). The hot hand in basketball: On the misperception of random sequences. *Cognitive Psychology*, 17(3), 295–314.

Graber, M. L., Franklin, N., & Gordon, R. (2005). Diagnostic error in internal medicine. *Archives of Internal Medicine*, 165(13), 1493–1499.

Graham, J. R., & Harvey, C. R. (2003). Expectations of equity risk premia, volatility and asymmetry from a corporate finance perspective. *NBER Working Paper No. 8678*.

Kahneman, D. (2011). *Thinking, Fast and Slow*. Farrar, Straus and Giroux.

Kahneman, D., & Lovallo, D. (1993). Timid choices and bold forecasts: A cognitive perspective on risk taking. *Management Science*, 39(1), 17–31.

Kahneman, D., & Tversky, A. (1979). Intuitive prediction: Biases and corrective procedures. *TIMS Studies in Management Science*, 12, 313–327.

Kruger, J., & Dunning, D. (1999). Unskilled and unaware of it: How difficulties in recognizing one's own incompetence lead to inflated self-assessments. *Journal of Personality and Social Psychology*, 77(6), 1121–1134.

Kuran, T., & Sunstein, C. R. (1999). Availability cascades and risk regulation. *Stanford Law Review*, 51(4), 683–768.

Lord, C. G., Ross, L., & Lepper, M. R. (1979). Biased assimilation and attitude polarization: The effects of prior theories on subsequently considered evidence. *Journal of Personality and Social Psychology*, 37(11), 2098–2109.

Lusardi, A., & Mitchell, O. S. (2014). The economic importance of financial literacy: Theory and evidence. *Journal of Economic Literature*, 52(1), 5–44.

Moore, D. A., & Healy, P. J. (2008). The trouble with overconfidence. *Psychological Review*, 115(2), 502–517.

Mussweiler, T., Strack, F., & Pfeiffer, T. (2000). Overcoming the inevitable anchoring effect: Considering the opposite compensates for selective accessibility. *Personality and Social Psychology Bulletin*, 26(9), 1142–1150.

Nisbett, R. E., Fong, G. T., Lehman, D. R., & Cheng, P. W. (1987). Teaching reasoning. *Science*, 238(4827), 625–631.

Northcraft, G. B., & Neale, M. A. (1987). Experts, amateurs, and real estate: An anchoring-and-adjustment perspective on property pricing decisions. *Organizational Behavior and Human Decision Processes*, 39(1), 84–97.

Rao, J. M., Chen, D. L., & Raj, S. (2019). Sequencing and choice: Evidence from large-scale administrative data. *SSRN Working Paper*.

Svenson, O. (1981). Are we all less risky and more skillful than our fellow drivers? *Acta Psychologica*, 47(2), 143–148.

Tversky, A., & Kahneman, D. (1973). Availability: A heuristic for judging frequency and probability. *Cognitive Psychology*, 5(2), 207–232.

Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.

Tversky, A., & Kahneman, D. (1983). Extensional versus intuitive reasoning: The conjunction fallacy in probability judgment. *Psychological Review*, 90(4), 293–315.

Viscusi, W. K. (1993). The value of risks to life and health. *Journal of Economic Literature*, 31(4), 1912–1946.

Wason, P. C. (1960). On the failure to eliminate hypotheses in a conceptual task. *Quarterly Journal of Experimental Psychology*, 12(3), 129–140.

---

*End of Chapter 2*

---

> **Looking Ahead.** Chapter 3 builds directly on the findings of Chapters 1 and 2 to present **Prospect Theory** — the formal model developed by Kahneman and Tversky (1979) to replace Expected Utility Theory. Prospect Theory formalises loss aversion (the asymmetry between gains and losses documented in Chapter 1), introduces the concept of reference dependence, and models the distinctive pattern of probability weighting that explains both the certainty effect and risk-seeking behaviour in the loss domain. It is the centrepiece of the behavioural economics of decision under uncertainty.
