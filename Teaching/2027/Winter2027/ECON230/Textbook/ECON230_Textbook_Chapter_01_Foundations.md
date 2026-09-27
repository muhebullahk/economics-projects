# Chapter 1: Beyond Rationality — The Foundations of Behavioural Economics

---

## Chapter Overview

This chapter introduces the field of behavioural economics by examining the assumptions that underlie the standard economic model and asking whether those assumptions are justified by evidence. We begin with the rational choice model — the dominant framework in economics for over a century — and carefully explain what it predicts and why economists found it so compelling. We then confront that model with empirical evidence: carefully designed experiments reveal that real human beings systematically violate the predictions of rational choice theory in ways that are predictable, consistent across cultures, and economically significant.

The chapter explains the concept of **bounded rationality**, developed by Nobel laureate Herbert Simon, which offers a more realistic portrait of human decision-making. We examine the **dual-process theory of cognition** — the distinction between fast, intuitive thinking and slow, deliberate reasoning — and show why this distinction matters for economic analysis. Finally, we survey the real economic costs that arise from systematic cognitive errors and discuss why market competition does not reliably eliminate these costs.

By the end of this chapter, you will understand why behavioural economics exists as a distinct field: not to dismiss the standard model, but to identify precisely where it succeeds and where it needs to be extended.

---

## Learning Objectives

After studying this chapter, students should be able to:

1. **Define** the core assumptions of the standard rational choice model and explain what they imply about human behaviour.
2. **State and interpret** Expected Utility Theory (EUT), including the four axioms on which it rests, and explain what it means to violate an axiom.
3. **Describe** the Allais Paradox and the Ellsberg Paradox and explain why each constitutes a challenge to EUT.
4. **Explain** framing effects, loss aversion, overconfidence, and present bias as systematic departures from the predictions of the standard model.
5. **Define** bounded rationality and explain Herbert Simon's concept of satisficing.
6. **Distinguish** between System 1 and System 2 thinking and explain how their interaction generates predictable errors.
7. **Evaluate** the claim that market competition eliminates the consequences of irrational behaviour.
8. **Assess** the economic costs of systematic cognitive bias, using evidence from household finance, labour markets, and health behaviour.
9. **Identify** the major methodological tools used in behavioural economics research.
10. **Situate** behavioural economics within the broader history of economic thought, identifying key figures and contributions.

---

## Introduction: The Puzzle at the Heart of Economics

Consider the following two problems. Take a moment to write down your answers before reading further.

---

**Problem A — Choose One:**
- Option 1: Receive $1,000,000 with certainty.
- Option 2: A lottery with an 89% chance of $1,000,000, a 10% chance of $5,000,000, and a 1% chance of receiving nothing.

**Problem B — Choose One:**
- Option 1: An 11% chance of $1,000,000, and an 89% chance of nothing.
- Option 2: A 10% chance of $5,000,000, and a 90% chance of nothing.

---

Most people who encounter these problems choose Option 1 in Problem A — preferring the certainty of a million dollars over a gamble that gives a small chance of losing everything — and Option 2 in Problem B, reasoning that the 10% chance of $5 million is worth more than the 11% chance of $1 million.

These choices feel reasonable. They feel consistent. They feel like what any sensible person would do.

They are mathematically contradictory.

If you prefer Option 1 in Problem A and Option 2 in Problem B, you have violated one of the fundamental axioms of rational choice under uncertainty — the independence axiom — and your preferences cannot be represented by any expected utility function. The French economist Maurice Allais demonstrated this in 1953, presenting the problem to a group of distinguished economists in Paris. Several of them, including Paul Samuelson, one of the most celebrated economists of the twentieth century, initially gave the contradictory pair of answers before catching their error. The pattern has since been replicated in dozens of experiments, across cultures, stake sizes, and levels of economic training.

This is the starting point of behavioural economics. Not the observation that people are irrational — the field takes no such position — but the observation that human decision-making departs from the predictions of the standard model in ways that are **systematic, predictable, and economically significant**.

Understanding those departures, their causes, and their consequences is the subject of this course.

---

## 1. The Standard Economic Model

### 1.1 What Does Economics Assume?

To appreciate what behavioural economics contributes, we first need to understand the model it challenges. Standard economics — sometimes called the neoclassical model — rests on a set of assumptions about human behaviour that have proven extraordinarily powerful for building economic theory and generating testable predictions.

The central figure in this model is the **rational agent**: a decision-maker who possesses well-defined preferences, processes information without systematic error, and always chooses the option that best satisfies those preferences given the available constraints.

More precisely, the standard model typically assumes:

**Complete preferences.** The rational agent can rank any two options. Given any pair of choices — two job offers, two investment portfolios, two meals — the agent either prefers one to the other or is indifferent between them. The response "I just can't decide" is not permitted as a stable state; it must reflect some underlying ranking that, in principle, the agent could articulate.

**Transitivity.** Preferences are logically consistent in a particular sense: if you prefer outcome A to outcome B, and you prefer B to C, then you must prefer A to C. This rules out preference cycles of the form "I prefer coffee to tea, tea to water, and water to coffee." Such cycles would make an agent vulnerable to exploitation — a clever trader could extract unlimited resources from someone with cyclic preferences by executing a series of trades that loop back to the starting point.

**Full optimisation.** Given all relevant information, the rational agent computes the globally optimal action and executes it, at zero cognitive cost. There is no notion of the computation being "too hard" or the decision "taking too long."

**Bayesian updating.** When new information arrives, rational agents update their beliefs exactly as the laws of probability dictate. Prior beliefs are adjusted by the likelihood of the new evidence, yielding posterior beliefs that are mathematically correct.

**Time consistency.** The rational agent's preferences do not change simply because time passes or because an option moves from the future into the present. A plan made today for next year will not be abandoned when next year arrives, unless new information has arrived.

**Self-interest.** In the basic model, agents care only about their own material payoffs. More advanced versions of the standard model allow for altruism, but even then preferences are taken as fixed, stable, and clearly defined.

It is important to state immediately — and to repeat it, because students often misread this — that economists do not actually believe people are perfect calculating machines. The assumptions of the standard model are not meant as accurate psychological descriptions. They are **idealisations** that make the model tractable and allow it to generate sharp predictions. The question is not whether the assumptions are literally true, but whether the model built on them generates useful insights and accurate predictions.

The honest answer is: often yes, and sometimes no. Behavioural economics is the project of systematically identifying when the answer is "no" and building better models for those domains.

> **Box 1.1: Why Assume Rationality If It Isn't True?**
>
> The economist Milton Friedman argued that economic models should be judged not by the realism of their assumptions but by the accuracy of their predictions. A model of billiards, he observed, might assume that the billiard player computes the exact angle of each shot using the laws of physics — which no player actually does consciously. But if the model predicts where the ball ends up, the unrealistic assumption is harmless.
>
> The problem, as behavioural economists have demonstrated, is that in many economically important domains the predictions of the rational agent model are systematically wrong in ways that cannot be dismissed as random noise. When deviations from rationality are predictable and consistent, they matter for policy, for business, and for welfare.

---

### 1.2 Expected Utility Theory

The most important formal framework in the standard model for decision-making under uncertainty is **Expected Utility Theory (EUT)**, developed axiomatically by John von Neumann and Oskar Morgenstern in their 1944 masterpiece *Theory of Games and Economic Behavior*.

The theory addresses a fundamental question: how should a rational person choose between lotteries — options that yield different outcomes with different probabilities?

Von Neumann and Morgenstern's answer: a rational agent should choose the lottery that maximises **expected utility**, computed as:

$$EU = \sum_{i} p_i \cdot u(x_i)$$

where:
- $p_i$ is the probability that outcome $x_i$ occurs
- $u(x_i)$ is the utility the agent derives from outcome $x_i$
- The sum is taken over all possible outcomes

In words: the expected utility of a lottery is the probability-weighted average of the utilities of its outcomes. To choose between lotteries, a rational agent computes the expected utility of each and selects the one with the highest value.

**A Simple Example**

Suppose you face a gamble: a 50% chance of winning $100 and a 50% chance of winning nothing. Your expected utility from this gamble is:

$$EU(\text{Gamble}) = 0.5 \cdot u(\$100) + 0.5 \cdot u(\$0)$$

Compare this to the utility of receiving $50 for certain: $u(\$50)$.

Whether you prefer the gamble or the certain $50 depends on the shape of your utility function $u(\cdot)$.

- If $u$ is **concave** — that is, each additional dollar of wealth produces smaller additional utility than the previous one — then $u(\$50) > 0.5 \cdot u(\$100) + 0.5 \cdot u(\$0)$, and you prefer the certain $50. This is **risk aversion**, the tendency to prefer a certain outcome over a gamble with the same expected monetary value.
- If $u$ is **convex**, you prefer the gamble: **risk seeking**.
- If $u$ is **linear**, you are indifferent: **risk neutral**.

**Figure 1.1: Concave Utility Function and Risk Aversion**

```
u(w) ↑
      │
  100 ┤                                        ● u(100)
      │                                   ·
      │                              ·
   80 ┤                         · ← u(w) concave curve
      │                    ·
      │               ·
   60 ┤          ·  ← u(50) [above chord]
      │        ·╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌ ← chord
      │      ╌  ← E[u(gamble)] on chord
   40 ┤   ╌
      │ ╌       ↑ Risk Premium = u(50) − E[u]
   20 ┤╌         CE   50
      │● u(0)    ↑
      │          Certainty Equivalent (CE) < 50
    0 ┼──────┬──────────────┬──────────────────→ w
      0      CE    50              100

    KEY:  ·····  = concave utility curve u(w)
          ╌╌╌╌╌  = chord connecting u(0) and u(100)
          u(50) lies ABOVE chord → risk aversion
          Risk Premium = E[w] − CE = 50 − CE > 0
```

| | Description |
|---|---|
| **What the figure shows** | A curved utility function $u(w)$ plotted against wealth $w$, bending downward (concave). For a gamble between $0 and $100, the expected monetary value is $50, but the expected utility (the probability-weighted average of $u(\$0)$ and $u(\$100)$) lies below $u(\$50)$. The difference represents the **risk premium**: how much certainty is worth to a risk-averse agent. |
| **How to interpret it** | The concavity of the utility function captures the idea of diminishing marginal utility of wealth: going from $0 to $50 increases utility more than going from $50 to $100. This makes the sure thing more attractive than the gamble with the same expected monetary value. |

The elegance of EUT is that a single function $u(\cdot)$ captures all of a person's attitudes toward risk. But this elegance rests on four axioms.

---

### 1.3 The Four Axioms of Expected Utility Theory

Von Neumann and Morgenstern showed that if a rational agent's preferences over lotteries satisfy four conditions — completeness, transitivity, continuity, and independence — then those preferences can always be represented by an expected utility function. Conversely, violating any one of these axioms means that the agent's choices cannot be described by EUT.

**Axiom 1: Completeness.** For any two lotteries $A$ and $B$, the agent either prefers $A$ to $B$, prefers $B$ to $A$, or is indifferent between them. This is the assumption we already encountered: preferences are complete.

**Axiom 2: Transitivity.** If the agent prefers $A$ to $B$ and prefers $B$ to $C$, then the agent prefers $A$ to $C$. Preferences are logically consistent and non-circular.

**Axiom 3: Continuity.** If $A \succ B \succ C$, then there exists some probability $p$ such that the agent is indifferent between $B$ for certain and the mixture "lottery $A$ with probability $p$, lottery $C$ with probability $1-p$." This rules out extreme preferences where no probability trade-off can substitute for a particular outcome.

**Axiom 4: Independence (The Critical Axiom).** If you prefer lottery $A$ to lottery $B$, then for any third lottery $C$ and any probability $p$, you must also prefer "lottery $A$ with probability $p$ and lottery $C$ with probability $1-p$" over "lottery $B$ with probability $p$ and lottery $C$ with probability $1-p$."

In plain English: if you prefer $A$ to $B$, mixing both with the same outside option $C$ should not reverse your preference. The comparison between $A$ and $B$ should be unaffected by the identical probabilistic context in which both are embedded.

This axiom sounds almost trivially reasonable. It turns out to be the one that most people violate, most of the time, in precisely the way that Allais demonstrated.

**Table 1.1: The Four EUT Axioms**

| Axiom | Technical Statement | Plain Meaning | Why It Matters |
|---|---|---|---|
| Completeness | For all $A$, $B$: $A \succ B$, $B \succ A$, or $A \sim B$ | You can always rank any two options | Allows preferences to be represented by a utility function |
| Transitivity | $A \succ B$ and $B \succ C$ implies $A \succ C$ | No preference cycles | Rules out exploitation through repeated trades |
| Continuity | Always a probability $p$ creating indifference | Small probability changes create small preference changes | Makes utility functions continuous |
| Independence | $A \succ B$ implies $pA+(1-p)C \succ pB+(1-p)C$ | Mixing with outside option preserves ranking | Allows probabilities to "multiply through" in EU calculation |

---

### 1.4 The Power of the Rational Model

Before examining where this model fails, it is worth pausing to appreciate where it succeeds — which is in an enormous range of economically important domains.

**Nuclear deterrence.** During the Cold War, Thomas Schelling's rational-actor analysis of mutually assured destruction provided the strategic logic for nuclear deterrence policy. The prediction that rational actors would never launch first strikes because the retaliation would destroy them proved stable for decades.

**Portfolio theory.** Harry Markowitz (Nobel Prize, 1990) used expected utility maximisation to derive the principle of diversification: rational investors should hold portfolios of assets, not individual assets, because diversification eliminates idiosyncratic risk without sacrificing expected return. This insight underpins the entire modern investment industry.

**Auction design.** William Vickrey's (Nobel 1996) analysis of bidding strategies in auctions relied on rational-agent assumptions. Paul Milgrom and Robert Wilson (Nobel 2020) used these insights to design the US Federal Communications Commission's spectrum auctions, generating hundreds of billions of dollars for American taxpayers.

**Trade theory.** The law of comparative advantage, the gains from international trade, the logic of specialisation — all rest on rational optimisation. These predictions have been broadly confirmed by decades of empirical evidence.

The point is not that the rational model is wrong. It is that it is not always right, and in systematically wrong in certain domains — precisely the domains that behavioural economists have identified.

---

## 2. Evidence Against the Standard Model

The empirical challenge to EUT did not come from a single experiment. It came from a body of evidence accumulated over decades, across cultures and stake sizes, showing that human beings systematically violate the axioms of EUT in predictable ways. This section surveys the most important findings.

### 2.1 The Allais Paradox: Violating the Independence Axiom

Return to the problems at the beginning of this chapter. Most people choose Option 1 in Problem A and Option 2 in Problem B. Under EUT with $u(0) = 0$, we can derive the implication of each choice.

From choosing Option 1 in Problem A:
$$u(1\text{M}) > 0.89 \cdot u(1\text{M}) + 0.10 \cdot u(5\text{M}) + 0.01 \cdot u(0)$$
$$0.11 \cdot u(1\text{M}) > 0.10 \cdot u(5\text{M})$$

From choosing Option 2 in Problem B:
$$0.10 \cdot u(5\text{M}) + 0.90 \cdot u(0) > 0.11 \cdot u(1\text{M}) + 0.89 \cdot u(0)$$
$$0.10 \cdot u(5\text{M}) > 0.11 \cdot u(1\text{M})$$

The two implications directly contradict each other. If the first is true, the second cannot be. No utility function can simultaneously generate both choices.

**Why does this happen?** The key is the presence of **certainty**. In Problem A, Option 1 is certain — it carries no risk whatsoever. When certainty is on the table, people weight it disproportionately highly, more than EUT predicts. Allais called this the **certainty effect**: outcomes that are certain are overweighted relative to outcomes that are merely probable.

This is not a logical error in any obvious sense. It is a systematic preference for certainty that most human beings share. But it violates the independence axiom and therefore lies outside the domain that EUT can describe.

> **Research Study: The Allais Paradox**
>
> **Researcher:** Maurice Allais
> **Year:** 1953
> **Research Question:** Do educated economic agents satisfy the independence axiom of expected utility theory?
> **Method:** Allais presented a pair of choice problems (now called the Allais problems) to leading economists at a Paris conference. Participants made choices between lotteries in two problems. The critical test was whether choices in Problem 1 were consistent with choices in Problem 2.
> **Results:** Most participants — including several Nobel laureates in economics — chose the option that violated the independence axiom. The pattern is: "safe" choice in Problem A (certainty preferred) and "risky" choice in Problem B (the bigger prize preferred when there's no certainty to be had).
> **Economic Interpretation:** The standard EUT model cannot accommodate these preferences. A utility function that rationalises the first choice necessarily contradicts the second choice.
> **Behavioural Insight:** The certainty effect — the disproportionate weight people place on outcomes that are certain — is a deep feature of human preference that is not captured by expected utility maximisation.

The Allais paradox has been replicated in dozens of studies in countries spanning every continent, with stakes ranging from trivial to very large. It is one of the most robust findings in all of experimental economics.

---

### 2.2 The Ellsberg Paradox: Ambiguity Aversion

The Allais paradox reveals a systematic deviation from EUT in situations involving **risk** — where the probabilities of outcomes are known. The **Ellsberg paradox**, proposed by Daniel Ellsberg in 1961, reveals a separate and equally important deviation in situations involving **uncertainty** — where probabilities are not known.

**The Setup.** An urn contains 90 balls. You are told that exactly 30 of the balls are red. The remaining 60 balls are either black or yellow in some unknown proportion: it could be 60 black and 0 yellow, 0 black and 60 yellow, or anything in between. You are asked to choose between two bets in each of two problems.

**Problem 1:**
- Bet A: Win $100 if a red ball is drawn.
- Bet B: Win $100 if a black ball is drawn.

**Problem 2:**
- Bet C: Win $100 if a red or yellow ball is drawn.
- Bet D: Win $100 if a black or yellow ball is drawn.

Most people prefer Bet A in Problem 1 and Bet D in Problem 2.

Now consider what these choices imply. Preferring A to B in Problem 1 implies that you believe the probability of drawing red (1/3) exceeds the probability of drawing black. Let $p_\text{black}$ denote your subjective probability of drawing a black ball. Then $p_\text{black} < 1/3$.

But preferring D to C in Problem 2 implies that you believe black or yellow (probability $p_\text{black} + p_\text{yellow}$) is more likely than red or yellow ($1/3 + p_\text{yellow}$). This means $p_\text{black} > 1/3$.

The two choices imply contradictory probability assignments. No subjective probability over the outcomes can simultaneously rationalise both choices.

**Why does this happen?** The 30 red balls represent **risk** — the probability of red is precisely known to be 1/3. The black balls represent **uncertainty** or **ambiguity** — the probability of black is unknown. People systematically prefer to bet on the known probability (red) over the unknown one (black), and they do so even when the structure of the problem logically requires them to assign the same probability to both.

This phenomenon is called **ambiguity aversion**: the preference for known risks over unknown risks, even when that preference is inconsistent with any coherent probability assignment. It is distinct from ordinary risk aversion, which involves being willing to pay a premium to reduce known risk. Ambiguity aversion is an aversion to not knowing the probabilities at all.

Ambiguity aversion has important real-world implications. It helps explain why:
- People prefer familiar domestic investments to foreign ones (**home bias** in financial markets).
- Insurance demand is higher for familiar, well-publicised risks (car accidents) than for unfamiliar ones (earthquake), even when the latter has higher expected loss.
- Workers accept lower wages to stay in stable, well-understood jobs rather than moving to potentially more lucrative but uncertain careers.

---

### 2.3 Framing Effects: The Asian Disease Problem

Perhaps the most famous single experiment in behavioural economics is the **Asian Disease Problem**, reported by Amos Tversky and Daniel Kahneman in the journal *Science* in 1981. It demonstrates that how a problem is described — its **frame** — can reverse preferences, even when the underlying options are mathematically identical.

**The Experiment.** Participants were told that an unusual Asian disease is expected to kill 600 people. They were asked to choose between two programmes. Crucially, half the participants received the problem stated in a **gain frame** and half received it stated in a **loss frame**.

**Gain Frame:**
- Programme A: 200 people will be saved.
- Programme B: A 1/3 probability that all 600 will be saved, and a 2/3 probability that none will be saved.

**Loss Frame:**
- Programme C: 400 people will die.
- Programme D: A 1/3 probability that nobody will die, and a 2/3 probability that all 600 will die.

In the gain frame, 72% of participants chose Programme A — the safe option. In the loss frame, 78% chose Programme D — the risky option. These choices are dramatically different.

But notice: Programme A and Programme C are mathematically identical. Both result in 200 survivors (equivalently, 400 deaths) with certainty. Programme B and Programme D are also identical: both result in a 1/3 chance of 600 survivors and a 2/3 chance of zero survivors. The two frames present exactly the same options; only the language differs.

Under EUT, preferences are defined over final outcomes — states of the world, not descriptions of states. A rational agent should see through the framing and make the same choice regardless of whether the options are described in terms of lives saved or lives lost. Tversky and Kahneman's finding shows that most people do not.

**The Pattern.** The finding reveals a systematic asymmetry in how people respond to gains and losses:
- In the **gain domain** (options described as lives saved), people are **risk averse**: they prefer the certain 200 survivors over the risky prospect.
- In the **loss domain** (options described as deaths), people are **risk seeking**: they prefer the risky prospect over the certain 400 deaths.

This pattern — risk aversion in the domain of gains and risk seeking in the domain of losses — is one of the cornerstones of Prospect Theory, which we study in Chapter 3. For now, the key insight is that the **reference point** from which outcomes are evaluated — whether something is coded as a gain or a loss — matters enormously for choice. This is not predicted by EUT.

The Asian Disease Problem has been replicated in over 50 countries, in policy contexts ranging from medical decisions to environmental policy, with similar results. It is one of the most robust findings in all of social science.

---

### 2.4 Loss Aversion: The Asymmetry of Pain

Framing effects arise partly because **losses feel worse than equivalent gains feel good**. This is the phenomenon of **loss aversion**, one of the most important and well-documented findings in behavioural economics.

The intuition can be illustrated with a simple bet. Would you accept a coin flip in which you win $150 if heads and lose $100 if tails? The expected monetary value of this bet is positive: $0.5 \times \$150 + 0.5 \times (-\$100) = \$25$. Most people refuse this bet. They require a gain of approximately $200–$250 to make them willing to risk a $100 loss.

More precisely, the empirical evidence suggests that the pain of losing $X is approximately **2 to 2.5 times** as large as the pleasure of gaining $X, all else equal. This ratio, denoted $\lambda$ (lambda), is the **loss aversion coefficient**:

$$\lambda \approx 2.25 \quad \text{(Tversky \& Kahneman, 1992)}$$

This finding has been replicated across many contexts:

- In consumer markets, Hardie, Johnson, and Fader (1993) analysed scanner data on consumer butter purchases and estimated $\lambda \approx 2.4$: price increases (a loss relative to the reference price) reduced demand roughly 2.4 times as much as equivalent price decreases (a gain) increased it.
- In labour markets, Akerlof, Dickens, and Perry (1996) showed that nominal wage cuts are far rarer than real wage cuts achieved through inflation — a pattern consistent with workers finding nominal losses especially painful, even when their real purchasing power is declining anyway.
- In financial markets, loss aversion contributes to the **disposition effect**: the tendency of investors to sell winning stocks too quickly (locking in gains) and hold losing stocks too long (avoiding the pain of realising a loss).

**Why doesn't standard utility theory predict this?** A concave utility function does produce risk aversion for large gambles — but for small gambles, a concave utility function implies nearly linear utility and therefore approximate risk neutrality. The observed aversion to small-stakes gambles like the $150/$100 coin flip is too strong to be explained by diminishing marginal utility of wealth alone, as Rabin (2000) demonstrated in a famous theorem. Loss aversion — an asymmetry around a reference point, not a property of the global utility function — is required.

**Figure 1.2: The S-Shaped Value Function**

```
  v(x) ↑
       │                            ·····  ← Gain domain
    80 ┤                       ····         (concave, flattens)
       │                  ·····
    40 ┤             ·····
       │        ·····
       │   ·····
     0 ┼───────────────────────────────────→ x (outcome)
    Loss domain      0 (Ref.)    Gain domain
       │·····
  −40 ┤     ·····
       │          ·····    ← Convex curve
  −80 ┤               ·····  (steeper than gain side)
       │                    ·····
 −120 ┤                          ···  λ ≈ 2.25×
       │
       │    LOSS DOMAIN             GAIN DOMAIN
       │  Convex + Steeper        Concave + Flatter
       │  (loss aversion)       (diminishing sensitivity)
       │
       │  For x = +50: v(+50) ≈ +36
       │  For x = −50: v(−50) ≈ −81   (ratio = 2.25)
```

| | Description |
|---|---|
| **What the figure shows** | A value function $v(\cdot)$ plotted with a reference point at the origin. For gains (outcomes to the right of zero), the function is concave: each additional dollar of gain produces diminishing additional value. For losses (outcomes to the left), the function is convex and steeper: the same dollar amount produces more pain as a loss than pleasure as a gain. The function is S-shaped, steeper for losses than for gains. |
| **How to interpret it** | The kink at the origin (the reference point) captures the asymmetry between gains and losses. The steeper slope in the loss domain relative to the gain domain reflects $\lambda \approx 2.25$: losses loom approximately twice as large as equivalent gains. This shape cannot be described by any simple concave utility function. |

---

### 2.5 Overconfidence: Knowing Less Than You Think

A further major departure from the standard model concerns **beliefs**. Rational agents, according to EUT, form accurate probabilistic beliefs and update them correctly when new information arrives. The empirical evidence suggests that real people systematically hold **overconfident** beliefs: they think they know more than they do, they overestimate the probability of their success, and they underestimate their uncertainty.

Several distinct dimensions of overconfidence have been identified:

**Above-average bias (Better-Than-Average Effect).** A famous study by Svenson (1981) asked American and Swedish drivers to rate their own driving skill relative to others on the road. In the American sample, 93% of participants rated themselves as above-average drivers. In the Swedish sample, 69% did. By definition, at most 50% of drivers can be above average. The pattern of overestimating one's relative standing has been replicated for a wide range of skills: teaching, management ability, intelligence, and ethics.

**Calibration overconfidence.** When people are asked to state 90% confidence intervals for numerical quantities — ranges within which they are 90% confident the true answer falls — the true answer falls within their intervals only about 50–60% of the time, not 90%. People's subjective uncertainty is far too narrow. They are "surprised" by outcomes that should have fallen within their stated range.

**The Planning Fallacy.** People systematically underestimate the time and cost required to complete projects. The Sydney Opera House was budgeted at $7 million in 1957 and completed in 1973 at a cost of $102 million — fourteen times the original estimate. Denver International Airport opened sixteen months late and $2 billion over budget. Scottish Parliament cost ten times its initial estimate. This pattern appears across construction projects, software development, and personal plans alike.

**The Impact on Financial Markets.** Perhaps the most carefully documented economic cost of overconfidence comes from financial trading. Barber and Odean (2001) analysed the trading records of 35,000 household investment accounts in the United States over the period 1991–1997. They found that investors who traded most actively — consistent with overconfidence in the quality of their information — earned net annual returns 1.4 percentage points lower than investors who traded least. Male investors, who exhibited higher overconfidence, traded 45% more than female investors and earned 1.4% per year less. The excess trading generated transaction costs and tax liabilities that eroded returns without improving performance.

> **Research Study: Overconfidence in Financial Trading**
>
> **Researchers:** Brad Barber and Terrance Odean
> **Year:** 2001
> **Research Question:** Does overconfident trading activity reduce investor returns?
> **Method:** Barber and Odean analysed monthly brokerage data on 35,000 households over 1991–1997, linking trading frequency to net investment performance. They interpreted high trading frequency as a behavioural signature of overconfidence.
> **Results:** The 20% of households that traded most frequently earned an average annual net return of 11.4%. The 20% that traded least frequently earned 18.5%. The difference of 7.1 percentage points — compounded over a lifetime — represents an enormous loss of wealth. Male investors traded 45% more than female investors and underperformed by approximately 1.4% per year.
> **Economic Interpretation:** Overconfident investors generate large trading volumes that may look like market liquidity but largely represent wealth destruction through transaction costs.
> **Behavioural Insight:** The Dunning-Kruger effect — the tendency for less-skilled individuals to overestimate their competence — applies with particular force in financial markets, where feedback is noisy and success can easily be attributed to skill rather than luck.

---

### 2.6 Present Bias: The Failure of Time Consistency

The final major violation we examine in this chapter concerns the temporal structure of preferences. The standard model, in most formulations, assumes that people discount future payoffs using **exponential discounting**: each period in the future reduces the present value of an outcome by a constant factor $\delta \in (0,1)$:

$$PV = \sum_{t=0}^{T} \delta^t \cdot u(x_t)$$

A crucial property of exponential discounting is **time consistency**: preferences over future options do not change as those options approach in time (absent new information). If you prefer to receive $100 in one year over $90 today, you will still prefer $100 in one year when that date is tomorrow, choosing to wait rather than receiving $90 immediately.

The empirical evidence contradicts this prediction.

A classic experiment by Thaler (1981) asked participants to state the amount of money they would need to receive at various future dates to make them indifferent to receiving a smaller amount now. The results, shown below, reveal a pattern of **declining discount rates**:

**Table 1.2: Thaler's (1981) Declining Discount Rate Experiment**

| Delay | Amount Now | Equivalent Future Amount | Implied Annual Discount Rate |
|---|---|---|---|
| 1 month | $15 | $20 | 345% |
| 1 year | $15 | $50 | 120% |
| 10 years | $15 | $100 | 19% |

The implied discount rate is not constant. It falls dramatically as the time horizon lengthens. Short delays are discounted at very high rates (hundreds of percent per year); long delays are discounted at modest rates (tens of percent per year). This pattern — **hyperbolic discounting** — means that the relative attractiveness of early options increases as they approach in time.

The consequence is **time inconsistency**: plans made for the future are abandoned when the future arrives. Consider the following thought experiment. On Monday, a student plans to spend all of Saturday studying. On Saturday morning, the plan is abandoned in favour of other activities. The student has not received any new information that should rationally revise the plan. The preference simply changed because the immediate option (leisure) became more salient as it moved from the future into the present.

This pattern — preferring the patient choice when both options are distant, but preferring the impatient choice when the immediate option is near — is called **present bias**. It manifests in:

- Undersaving for retirement despite the knowledge that future retirement is certain.
- Overeating despite the genuine desire to maintain a healthy diet.
- Procrastinating on exercise, studying, and other effortful but beneficial activities.
- Accumulating credit card debt at high interest rates while simultaneously holding savings at low interest rates.

Present bias and its implications for savings behaviour are studied in depth in Chapters 4 and 5.

---

## 3. Bounded Rationality: A Better Model of Human Decision-Making

The evidence surveyed above might seem to support a simple conclusion: people are irrational, and the standard model should be discarded. But this conclusion would be too hasty. The correct response is more nuanced and more productive.

### 3.1 Herbert Simon and the Limits of Optimisation

In the 1950s, long before the Allais paradox became famous and long before the field of behavioural economics existed under that name, the American social scientist Herbert Simon (Nobel Prize in Economics, 1978) argued that the standard model of rational optimisation was based on an unrealistic conception of human cognitive capacity.

Simon's key observation was straightforward but profound: **the human mind has finite computational power, finite working memory, and finite time.** Perfect optimisation — computing the globally best action among all possible actions given all available information — is simply not possible for creatures with these constraints. This is not a character flaw or a failure of education. It is a structural feature of human cognition.

Simon coined the term **bounded rationality** to describe the kind of rationality that real human beings exercise: rational in the sense of intending to make good choices and using deliberate reasoning, but operating within cognitive, informational, and temporal constraints that make full optimisation impossible.

Within these constraints, Simon argued, people do not optimise — they **satisfice**. Rather than searching exhaustively through all possible options for the globally best one, a satisficing agent searches until she finds an option that exceeds some **aspiration level** — a threshold of acceptability — and then stops.

**Satisficing in Practice.** Consider how you chose your current university. Did you research every university in the world, compute expected utility for each, and choose the globally optimal one? Almost certainly not. More plausibly, you identified a set of universities that seemed acceptable — that met your criteria for program quality, cost, location, and reputation — and chose one from that set. The final choice may have depended on details as arbitrary as which admissions letter arrived first or which campus visit you found more comfortable. This is satisficing: a reasonable, adaptive process that produces good enough decisions without requiring impossible computation.

> **Box 1.2: Simon's Scissors Metaphor**
>
> Simon described bounded rationality with an evocative metaphor: human behaviour is like the blades of a pair of scissors. One blade is the cognitive capacity of the human agent. The other blade is the structure of the environment — its complexity, the information it provides, the time pressure it imposes. Intelligent adaptive behaviour results from the interaction of both blades, not from either blade alone. To understand decision-making, we must study both cognition and environment. The mistake of the standard model, in Simon's view, was to focus exclusively on the optimisation capacity of the agent and ignore the environmental structure within which decisions are actually made.

---

### 3.2 Heuristics: The Shortcuts That (Usually) Work

Because full optimisation is impractical, people rely on **heuristics** — mental shortcuts or rules of thumb that allow quick, efficient decisions without exhaustive calculation. Heuristics are not random or arbitrary: they are evolved and learned strategies that tend to work well in the kinds of environments human beings have faced throughout their history.

For example:
- When estimating how common an event is, people often rely on **how easily examples come to mind** — the *availability heuristic*. Events that are more memorable tend to be judged more frequent.
- When assessing whether something belongs to a category, people rely on **how similar it is to a prototype of that category** — the *representativeness heuristic*.
- When making numerical estimates under uncertainty, people **start from an initial value and adjust** — the *anchoring and adjustment heuristic*.

Each of these heuristics is useful in many situations. The problem is that each also produces **systematic, predictable errors** in identifiable circumstances. Chapter 2 is devoted to a thorough examination of heuristics and the biases they generate.

---

### 3.3 The Paradox of Choice

One counterintuitive implication of bounded rationality is that more choice is not always better. The standard economic model predicts that additional options can never make a rational agent worse off — if a new option is dominated by existing ones, the agent simply ignores it. But for bounded rational agents operating with cognitive constraints, more options can be actively harmful.

This prediction was tested by Iyengar and Lepper (2000) in what has become one of the most cited experiments in behavioural economics.

> **Research Study: The Jam Study**
>
> **Researchers:** Sheena Iyengar and Mark Lepper
> **Year:** 2000
> **Research Question:** Does the size of a choice set affect consumer purchasing behaviour?
> **Method:** On two different Saturdays at a gourmet food market, the researchers set up a tasting display of jams. On one Saturday, they displayed 24 varieties of jam. On the other, they displayed 6 varieties. They recorded how many shoppers stopped to taste jam and how many subsequently made a purchase.
> **Results:** 60% of shoppers stopped at the large display, but only 3% made a purchase. 40% stopped at the small display, but 30% made a purchase. The small display generated ten times the purchasing rate of the large display.
> **Economic Interpretation:** The large choice set produced **choice overload**: the cognitive effort of evaluating 24 jams was sufficiently burdensome that shoppers found it easier to make no decision at all than to make a potentially regrettable choice. The standard model's prediction — that more options should weakly increase purchases — was flatly contradicted.
> **Behavioural Insight:** When the number of options exceeds the capacity of working memory and attention, the costs of deciding can outweigh the benefits of having more options. This is especially important in financial markets, healthcare, and retirement saving, where complexity is often high.

**Canadian Application.** Choi, Laibson, Madrian, and Metrick (2009) found that Canadians offered more mutual fund options in their registered retirement savings plans (RRSPs) contributed less and made worse investment choices. Choice overload in retirement savings is a real phenomenon with real consequences for long-run financial security.

---

## 4. Dual-Process Theory: Two Systems of Thought

### 4.1 System 1 and System 2

One of the most influential organising frameworks in contemporary behavioural economics is the **dual-process theory** of cognition, developed and popularised by psychologists Stanovich and West and brought to wide attention by Daniel Kahneman in his 2011 bestseller *Thinking, Fast and Slow*.

The theory distinguishes between two modes of cognitive processing that are active in human decision-making. These are conventionally called **System 1** and **System 2**, though it is important to understand that these are not distinct physical brain regions but rather characterisations of two types of cognitive processes.

**System 1** operates automatically, quickly, and without conscious effort. It runs in the background of conscious experience, generating intuitions, impressions, and feelings. It is the system responsible for:
- Recognising that a face is angry
- Reading a sentence and understanding its meaning
- Driving a familiar route without conscious attention
- Answering that $2 + 2 = 4$ without calculation

System 1 is powerful and efficient, but it is also prone to specific types of error. Because it operates associatively and relies on pattern recognition, it generates answers that feel right even when they are wrong — and it does so faster than System 2 can intervene to check them.

**System 2** operates deliberately, slowly, and with conscious effort. It is the system we engage when:
- Solving a long division problem
- Checking the logic of an argument
- Learning to drive for the first time
- Monitoring our behaviour in a social situation to ensure it is appropriate

System 2 is accurate and flexible, but it is cognitively costly. It requires sustained attention, depletes mental energy (the phenomenon known as **ego depletion**), and can only process one task at a time. Crucially, System 2 is **lazy**: it tends to endorse the quick answer generated by System 1 rather than computing the correct answer from scratch.

**Table 1.3: Comparing System 1 and System 2**

| Feature | System 1 | System 2 |
|---|---|---|
| Speed | Fast | Slow |
| Effort | Effortless | Effortful |
| Consciousness | Below awareness | Conscious and deliberate |
| Accuracy | Often right; sometimes systematically wrong | Usually right when engaged |
| Control | Automatic | Controlled |
| Examples | Pattern recognition, intuition, habit | Calculation, logic, self-monitoring |
| Capacity | High (can run in parallel with other tasks) | Low (serial; degrades under load) |

---

### 4.2 The Cognitive Reflection Test

A simple but revealing demonstration of System 1's tendency to override System 2 is the **Cognitive Reflection Test (CRT)**, designed by Shane Frederick (2005).

**Question 1.** A bat and a ball cost $1.10 in total. The bat costs $1.00 more than the ball. How much does the ball cost?

System 1 immediately generates an answer: $0.10. This feels right. But consider: if the ball costs $0.10, then the bat costs $1.10, and the total is $1.20 — not $1.10. The correct answer is $0.05 (bat = $1.05, total = $1.10). To reach this answer, System 2 must override System 1's intuitive response.

**Question 2.** If it takes 5 machines 5 minutes to make 5 widgets, how long would it take 100 machines to make 100 widgets?

System 1 says: 100 minutes. The correct answer is 5 minutes (each machine makes 1 widget in 5 minutes, so 100 machines make 100 widgets in 5 minutes).

**Question 3.** In a lake, a patch of lily pads doubles in size every day. After 48 days the lake is half full. After how many days is the lake completely full?

System 1 says: 24 days (half of 48). The correct answer is 49 days — if the lake is half full on day 48, it doubles to full on day 49.

These problems are simple enough that anyone with secondary-school mathematics can solve them — if System 2 is engaged. The difficulty is that System 1 generates a confident, plausible-seeming wrong answer so quickly that many people accept it without checking.

Frederick (2005) administered the CRT to undergraduates at elite American universities. Overall, only 17% of students in the full sample answered all three questions correctly. Even at MIT and Princeton, where students are exceptionally mathematically sophisticated, roughly half answered at least one question incorrectly. The CRT score is also correlated with economic behaviour: people who score lower on the CRT tend to exhibit higher present bias, greater overconfidence, and lower financial literacy.

---

### 4.3 The Interaction of the Two Systems

Dual-process theory helps organise and explain many of the phenomena described in this chapter:

- **The Allais paradox** arises because System 1 responds emotionally to the certainty of receiving $1 million — generating an immediate feeling of safety and satisfaction — while System 2 might, if fully engaged, recognise the mathematical inconsistency.
- **Framing effects** occur because System 1 processes the emotional valence of the description (lives saved vs. lives lost) before System 2 can neutralise it through abstract calculation.
- **Loss aversion** reflects System 1's emotional response to losses being stronger than its response to equivalent gains — a pattern that System 2 cannot easily override even when we know it is occurring.
- **Overconfidence** arises because System 1 generates confident feelings about our own ability that System 2 does not always check against objective evidence.
- **Present bias** reflects System 1's disproportionate response to immediate rewards relative to future ones — a response that System 2 can partially moderate through deliberate precommitment.

This does not mean that System 1 is always wrong or that System 2 is always right. System 1 is correct in the vast majority of everyday decisions — reading emotional cues from faces, navigating familiar social situations, making routine purchases. The errors occur in structured decision problems where System 1's pattern-matching heuristics produce systematically wrong answers, and where System 2 fails to intervene. Identifying the conditions under which this occurs is a central preoccupation of behavioural economics.

---

## 5. Why Markets Do Not Fix Everything

A standard objection to the concerns raised by behavioural economists goes as follows: even if individual agents are prone to cognitive errors, market competition should eliminate the economic consequences. Agents who make systematic mistakes will lose resources to those who do not. Over time, the marketplace will select for more rational behaviour, and the irrational will exit.

This argument has some merit. Markets do impose discipline. Firms that make consistently poor decisions face bankruptcy. Investors who make consistently poor trades lose money. There is selection pressure toward more accurate beliefs and more consistent preferences.

But the argument fails in several important respects.

### 5.1 Limits of Arbitrage

When asset prices deviate from fundamental values — as they might if irrational investors drive them away from equilibrium — rational traders should be able to profit by exploiting the mispricing, thereby pushing prices back toward fundamentals. This is the standard arbitrage argument.

De Long, Shleifer, Summers, and Waldmann (1990) showed that this argument breaks down in important cases. When **noise trader risk** is present — when the irrational investors who drove prices away from fundamental value could drive them even further away in the short run before correction occurs — rational arbitrageurs face significant risk. They may be unable to hold the correct position long enough for the mispricing to correct, because their investors may lose patience or their financing may run out. The famous phrase attributed to John Maynard Keynes applies: "Markets can remain irrational longer than you can remain solvent."

### 5.2 Correlated Errors

Market discipline works when different agents make different mistakes that cancel out in aggregate. But when cognitive errors are **correlated** — when many agents make the same mistake simultaneously — aggregate market behaviour can be just as irrational as individual behaviour.

The 2008 global financial crisis provides a vivid illustration. In the years preceding the crisis, a broad range of sophisticated financial institutions — investment banks, commercial banks, hedge funds, insurance companies, and rating agencies — simultaneously overestimated the diversification benefits of mortgage-backed securities and underestimated the probability of a nationwide decline in US house prices. This was not random error: it reflected a systematic cognitive bias — overconfidence in the accuracy of models built on a short historical period — shared across the industry. The result was a correlated collapse that no individual institution's correct beliefs could prevent.

### 5.3 Asymmetric Stakes

Competition may be most effective at eliminating costly errors in repeated, high-stakes environments where feedback is fast and clear. It is least effective in one-shot decisions (choosing a mortgage), low-frequency decisions (choosing a retirement fund), and situations where the consequences of errors are diffuse and delayed (undersaving for retirement). Many of the economically most important decisions people make fall into exactly these categories.

---

## 6. The Real Economic Cost of Cognitive Bias

The departures from rationality documented above are not merely intellectually interesting curiosities. They impose real economic costs on households, firms, and governments.

**Table 1.4: Estimated Economic Costs of Cognitive Bias (United States)**

| Domain | Estimated Annual Cost | Primary Bias | Source |
|---|---|---|---|
| Undersaving for retirement | ~$65 billion | Present bias | Choi et al. (2010) |
| Credit card debt from impatience | ~$25 billion | Present bias, loss aversion | Laibson et al. (2001) |
| Excessive trading in financial markets | ~$10 billion | Overconfidence | Barber & Odean (2001) |
| Total household investment mistakes | ~$80–100 billion | Multiple biases | Choi et al. (2010) |

**Canadian context.** The problem of undersaving is not confined to the United States:
- In 2022, only **27% of eligible Canadians** contributed to their Registered Retirement Savings Plans (RRSPs), despite an average unused contribution room exceeding $25,000 per filer (Statistics Canada, 2022).
- **47% of Canadians** reported living paycheque to paycheque in 2023 (FP Canada, 2023).
- Average credit card debt among Canadian cardholders was approximately **$4,200**, at interest rates of approximately 19.99% annually (Equifax Canada, 2023).
- An estimated **41%** of Canadians had no liquid savings at all.

Importantly, these patterns cannot be explained by lack of information. Surveys consistently show that Canadians are aware of the RRSP programme — more than 90% report knowing it exists — and they understand, in the abstract, that saving for retirement is important. The problem is not information. It is the predictable pull of present bias: the difficulty of choosing tomorrow's retirement security over today's immediate consumption.

---

## 7. Methods in Behavioural Economics

Behavioural economics is an empirical science. The theories described in this textbook are not accepted on philosophical grounds but on the basis of evidence produced by careful research. Understanding the methods used to generate that evidence is important both for evaluating the findings and for appreciating the field's credibility.

**Laboratory Experiments.** The most controlled form of evidence comes from laboratory experiments in which participants are randomly assigned to different conditions and offered real monetary incentives to make decisions. The controlled environment allows researchers to isolate specific cognitive mechanisms. The primary limitation is **external validity**: whether the behaviour observed in an artificial setting generalises to real-world decisions.

**Field Experiments.** Field experiments are randomised controlled trials (RCTs) conducted in natural settings — real workplaces, real stores, real government programmes. Participants do not know they are part of an experiment (in some designs) or are making real decisions with real consequences. Field experiments offer higher external validity than laboratory experiments while maintaining the causal identification that comes from randomisation. Governments around the world — including the UK's Behavioural Insights Team and Canada's own experimentation in regulatory policy — now run field experiments to evaluate interventions.

**Natural Experiments.** Sometimes policy changes or other external events create variation in the relevant independent variable that is not under the researcher's control, but that can be treated as approximately random for the purpose of causal inference. Changes in opt-out versus opt-in pension enrolment rules, for example, have been used as natural experiments to study the effect of defaults on savings behaviour.

**Survey Methods.** Surveys can elicit stated preferences, beliefs about the future, subjective assessments of probabilities, and subjective discount rates. The Canadian Survey of Financial Security (Statistics Canada) provides nationally representative data on household savings, debt, and financial attitudes. The limitation is that stated preferences may not match revealed preferences.

**Administrative and Transaction Data.** Brokerage records, credit card transaction data, scanner data from grocery stores, and tax return data provide large samples of actual behaviour in high-stakes, real-world settings. Barber and Odean's (2001) study of investment overconfidence used data from 35,000 brokerage accounts; Laibson and colleagues have used credit card transaction data to study present bias.

**Neuroeconomics.** Using functional magnetic resonance imaging (fMRI) and other neuroscientific methods, researchers have identified the neural correlates of loss aversion, social comparison, intertemporal choice, and other behavioural phenomena. When participants experience a potential loss, the brain's emotional centres — including the amygdala — show higher activation than when they experience equivalent gains, providing biological support for the asymmetry of loss aversion.

---

## 8. A Brief History of Behavioural Economics

The intellectual roots of behavioural economics extend further back than is sometimes appreciated. The field draws on a long tradition of psychological observation about human decision-making, dating to Adam Smith's *Theory of Moral Sentiments* (1759) — a work often overshadowed by his *Wealth of Nations* — in which Smith described envy, fairness concerns, and loss aversion with remarkable psychological precision.

In the twentieth century, the development of axiomatic Expected Utility Theory by Von Neumann and Morgenstern (1944) provided the formal benchmark against which departures could be measured. Herbert Simon's (1955) critique of full optimisation introduced bounded rationality. The Allais paradox (1953) was the first formal empirical challenge to EUT, though it attracted relatively little attention until Kahneman and Tversky's work in the 1970s.

The modern field of behavioural economics took shape with three landmark publications:

1. **Kahneman and Tversky (1974)**: "Judgment under Uncertainty: Heuristics and Biases" in *Science*, which documented the systematic patterns of error generated by the representativeness, availability, and anchoring heuristics.

2. **Kahneman and Tversky (1979)**: "Prospect Theory: An Analysis of Decision under Risk" in *Econometrica*, which provided the first formal model of decision-making under uncertainty that accommodated the observed violations of EUT, including loss aversion and the certainty effect. This paper is one of the most cited in all of economics.

3. **Thaler (1980)**: "Toward a Positive Theory of Consumer Choice" in the *Journal of Economic Behavior and Organization*, which introduced the concepts of mental accounting and the endowment effect into economics.

From these foundations, a broad and productive research programme emerged. Richard Thaler and Shlomo Benartzi developed the Save More Tomorrow programme (Chapter 5). Ernst Fehr and colleagues documented strong social preferences in experimental settings (Chapter 6). David Laibson formalised hyperbolic discounting (Chapter 4). Robert Shiller demonstrated that stock prices are far more volatile than can be explained by changes in fundamental value (Chapter 8). And the publication of Thaler and Sunstein's *Nudge* (2008) brought behavioural economics into the policy mainstream (Chapter 9).

The field has now received three Nobel Memorial Prizes in Economic Sciences:
- **1978**: Herbert Simon, for bounded rationality
- **2002**: Daniel Kahneman and Vernon Smith, for the integration of psychological research into economics
- **2017**: Richard Thaler, for contributions to behavioural economics

---

## 9. Behavioural Economics and Economic Policy

The findings described in this chapter have direct implications for economic policy. They suggest that the standard policy tools of economics — taxes, subsidies, and information provision — may be insufficient when the behaviours to be addressed arise from cognitive constraints rather than ignorance or financial incentives.

Providing accurate information about retirement savings (e.g., "You can save up to $X per year in an RRSP") does little to overcome present bias, because the problem is not that people do not know saving is beneficial — it is that the immediate cost of saving feels larger than the distant benefit.

This insight motivates the approach of **behavioural policy** or **libertarian paternalism** (Thaler and Sunstein 2003, 2008): designing the **choice architecture** — the context in which decisions are made — to steer people toward better choices without restricting their freedom to choose differently. The classic example is **automatic enrolment** in retirement savings programmes: instead of requiring employees to opt into a pension plan (which requires action), the default is enrolment (requiring inaction to exit). Because inertia — doing nothing — is the path of least resistance for a present-biased, cognitively limited agent, switching defaults dramatically increases participation rates.

The policy implications of specific behavioural findings are examined in detail throughout this textbook, with particular attention in Chapters 9 (Nudges and Choice Architecture) and 10 (Applications and Policy Design).

---

## 10. Applications

### 10.1 Consumer Behaviour

The findings of this chapter explain several puzzling patterns in consumer markets:

- **Brand loyalty** is partly a heuristic strategy: rather than evaluating all available products each time, consumers adopt rules like "buy the same brand I bought last time." This reduces cognitive effort but may lead to overpaying.
- **Sales and reference prices**: Retailers set "regular" prices as anchors. A "sale" price of $50 feels like a gain (saving $30 off the regular $80 price) even if the sale price is the standard market price. Loss aversion makes this framing effective.
- **Default options in contracts**: Subscription services that default to auto-renewal, insurance policies that default to the maximum coverage, and telephone plan defaults all exploit the fact that inertia — doing nothing — is the dominant response for time-constrained, present-biased consumers.

### 10.2 Financial Markets

Overconfidence leads to excessive trading, as documented by Barber and Odean. Loss aversion contributes to the disposition effect. Present bias leads to undersaving. Mental accounting — the tendency to treat money in different "accounts" differently, even when it is perfectly substitutable — leads to simultaneous high-interest borrowing and low-interest saving (holding a savings account at 1% while carrying credit card debt at 20%).

### 10.3 Labour Markets

Loss aversion in wages implies that workers resist nominal wage cuts much more strongly than equivalent real wage cuts achieved through inflation. Firms respond by using nominally rigid wages and adjusting employment (through layoffs) rather than wages during downturns — contributing to unemployment cycles.

Overconfidence in self-employment leads to higher-than-optimal rates of new business formation. More than half of new businesses fail within five years, yet surveys of entrepreneurs consistently show wildly optimistic expectations for their own firms.

### 10.4 Public Policy

Present bias leads to systematic undersaving, overeating, and underinvestment in preventive health. Standard policy responses (information campaigns, tax incentives) work with System 2 — the deliberate, calculating part of cognition. But the behaviour is often driven by System 1 — habitual, immediate, intuitive. Effective behavioural policy engages System 1 by redesigning the choice environment, not just providing better information.

**Canadian Example.** The Government of Canada has incorporated automatic RRSP and TFSA contribution features into some workplace benefit packages, inspired by the evidence on inertia and present bias. Participation rates in these programmes are substantially higher than in comparable opt-in programmes.

---

## Critical Thinking Questions

### Conceptual Questions

1. A student argues: "Rationality just means doing what's best for you, given your values and beliefs. By that definition, any choice a person makes is rational." Evaluate this argument. Is this what economists mean by rationality? What would this definition imply for the empirical testability of economic theory?

2. What is the difference between risk and uncertainty (in the sense of the Ellsberg paradox)? Why might an evolutionary argument predict ambiguity aversion? Does ambiguity aversion strike you as irrational?

3. In the Asian Disease Problem, the choice of Option A in the gain frame and Option D in the loss frame is mathematically inconsistent but many people would defend their choices as reasonable. Who is right — the people making the choices or the economist pointing out the inconsistency? What conception of rationality grounds each position?

4. Kahneman argues that System 1 is often correct and efficient — it does the right thing in familiar situations. Under what circumstances does System 1 work well? What features of a situation tend to push System 1 toward error?

5. Simon argued that heuristics are not irrational but rational adaptations to the structure of the environment. Is bounded rationality a form of rationality, or is it a departure from rationality? What would it mean for bounded rationality to be "rational"?

6. The standard model predicts that additional choice options can never make a rational consumer worse off. Why doesn't this prediction hold for bounded rational agents? What does this imply about how consumer markets should be regulated?

7. Loss aversion implies that the pain of a $100 loss exceeds the pleasure of a $100 gain. Does this mean people should be willing to pay more than $100 to avoid a $100 loss? What does this predict about the demand for insurance?

8. Overconfidence seems to be prevalent and persistent. If it leads people to make worse decisions, why hasn't natural selection or market competition eliminated it? Can you think of circumstances in which overconfidence might be adaptive?

9. The claim "markets don't fix irrationality" relies on specific features of markets. Under what conditions would you expect markets to be most effective at disciplining irrational behaviour? Least effective?

10. Behavioural economics studies departures from the rational model. But is there a danger that by documenting how people fail to be rational, we lose sight of how impressively well human cognition works in most everyday situations?

### Application Questions

11. A credit card company sends a bill that emphasises "minimum payment due: $35" rather than "full balance owing: $1,200." How would bounded rationality and loss aversion predict this will affect customer behaviour? What evidence would you need to test your prediction?

12. A grocery store places healthy items at eye level and unhealthy snacks in less visible locations. A standard economist says this is manipulative and irrelevant — rational consumers would search for what they want regardless of shelf position. How does bounded rationality change this prediction?

13. Two firms offer identical health insurance policies. Firm A describes the policy as "covering 80% of your medical expenses." Firm B describes the same policy as "leaving you responsible for 20% of your medical expenses." Under EUT, which would you expect to be more popular? What does behavioural economics predict?

14. A government wants to increase organ donation rates. Option A is an opt-in system (you must register to donate). Option B is an opt-out system (you are registered to donate unless you actively withdraw). Use the concepts from this chapter to predict the difference in donation rates. What data from real countries would you use to test this prediction?

15. In 2022, only 27% of eligible Canadians contributed to their RRSPs, despite an average unused contribution room of over $25,000. Standard economics would explain this as a preference for current consumption. What additional explanations does behavioural economics offer? What policy would you design to address each explanation?

16. A student consistently spends the first week of each month working hard on assignments, then relaxes and falls behind in weeks two to four, then panics and works hard again in week four. This pattern repeats every month. Use dual-process theory and hyperbolic discounting to explain this behaviour.

17. A real estate agent tells a prospective buyer: "This neighbourhood has recently seen some houses sell for $1.2 million." The house the buyer is considering asking price is $850,000. How might the agent's comment affect the buyer's willingness to pay? What heuristic is at work, and what should the buyer do to correct for it?

18. Studies find that people in countries with opt-out organ donation laws are more likely to be registered donors, but are not more likely to have strong positive opinions about organ donation. What does this tell us about the relationship between preferences and revealed choices in the presence of defaults?

19. A firm is considering whether to cut wages by 5% or maintain wages while laying off 10% of staff. Both options reduce labour costs by the same amount. Loss aversion and the evidence on nominal wage resistance suggest the workforce will respond differently to each. How?

20. You are advising a public health official on a campaign to increase flu vaccination rates among Canadians over 65. How would you frame the message using the insights of prospect theory? Specifically, would you emphasise the gains from getting vaccinated or the losses from not getting vaccinated?

### Discussion Questions

21. Dual-process theory is popular with neuroscientists and psychologists, but some economists worry it is too vague to generate precise predictions. What do you see as the main strengths and limitations of System 1/System 2 as an economic model?

22. "Behavioural economics is not really economics — it's just psychology with equations." Evaluate this claim. In what sense is behavioural economics a distinct field from psychology? From standard economics?

23. The concept of present bias suggests that people's choices systematically fail to serve their own long-run interests. This provides a paternalistic rationale for government intervention. But who decides what people's "true" long-run interests are? Is there a risk that behavioural policy becomes patronising or authoritarian?

24. Evidence for loss aversion and overconfidence comes predominantly from laboratory experiments conducted in rich, Western, educated, industrialised, democratic (WEIRD) countries. To what extent do you think these findings generalise to other cultural and economic contexts?

25. Herbert Simon argued that satisficing is a rational response to cognitive constraints. Richard Thaler and Cass Sunstein argue that nudges are justified because people have "true" preferences that they fail to act on due to bounded rationality. Are these views consistent with each other? Who decides what a person's "true" preferences are?

26. Consider the claim: "We should not trust research from behavioural economists because they have an incentive to find departures from rationality — that's what their careers are built on." Is this a valid concern? How does the structure of the scientific process — replication, peer review, adversarial collaboration — address it?

27. The Cognitive Reflection Test finds that many students at elite universities answer at least one question incorrectly. What does this tell us about the relationship between general intelligence, education, and cognitive biases?

28. Overconfidence leads entrepreneurs to overestimate their probability of success. If more entrepreneurs start businesses than is socially optimal, does this create a problem, and if so, for whom? Are there circumstances in which overconfident entrepreneurs generate positive externalities that justify their overentry?

29. Compare the policies: (a) mandatory automobile seat belt laws (hard paternalism) and (b) a default setting in new cars that produces an alert if the driver is not wearing a seat belt (soft paternalism/nudge). What values underlie each approach? Which is more consistent with the behavioural economics framework?

30. Suppose a study finds that people who scored low on a cognitive reflection test save significantly less for retirement. Would it be ethical for a bank to use CRT scores to design individualised "nudges" — showing different default savings rates to different customers based on their cognitive test scores? What are the arguments for and against?

---

## Chapter Summary

This chapter has introduced the foundations of behavioural economics by examining the standard rational choice model and confronting it with systematic empirical evidence. The major concepts and conclusions are:

**The Standard Model and Its Assumptions.** The rational agent model assumes complete preferences, transitivity, full optimisation, Bayesian updating, and time consistency. Expected Utility Theory (Von Neumann and Morgenstern, 1944) formalises rational choice under uncertainty as the maximisation of probability-weighted utility. The theory rests on four axioms — completeness, transitivity, continuity, and independence — and generates powerful predictions across many economic domains.

**Systematic Violations of Expected Utility Theory.** Four major classes of evidence challenge EUT:
1. The *Allais paradox* demonstrates that most people violate the independence axiom by overweighting certain outcomes (the certainty effect).
2. The *Ellsberg paradox* demonstrates ambiguity aversion — people's preference for known risks over unknown ones, even when the mathematical structure of the problems is identical.
3. *Framing effects* demonstrate that choices between mathematically identical options reverse when the options are described as gains versus losses.
4. *Loss aversion* demonstrates that losses loom approximately 2–2.5 times as large as equivalent gains, generating risk aversion in the gain domain and risk seeking in the loss domain.

Additional departures include overconfidence and miscalibration of beliefs, and present bias / hyperbolic discounting — the tendency to weight the present disproportionately heavily relative to the future.

**Bounded Rationality.** Herbert Simon (1955, Nobel 1978) proposed that people are boundedly rational: they intend to make good decisions but are constrained by cognitive, informational, and temporal limits. Rather than optimising, they satisfice — searching until they find an option above an aspiration level. This framework is more realistic and makes more accurate predictions in complex decision environments.

**Dual-Process Theory.** System 1 (fast, automatic, intuitive) and System 2 (slow, deliberate, analytical) operate in parallel. System 1 is efficient and usually correct, but generates systematic errors in structured decision problems. System 2 can correct these errors but is cognitively costly and tends to be lazy. Many of the violations of EUT documented by behavioural economists reflect the dominance of System 1 in situations where System 2 correction is costly or fails to engage.

**Market Discipline.** Market competition does not reliably eliminate the consequences of cognitive bias, for three reasons: limits to arbitrage (rational traders cannot always profit from others' mistakes), correlated errors (systematic biases can move markets collectively), and asymmetric stakes (competition is weakest in exactly the domains — long-run financial planning, one-shot decisions — where biases matter most).

**Economic Costs.** Systematic cognitive bias imposes real economic costs: an estimated $80–100 billion annually in household investment mistakes in the US, and significant undersaving, over-borrowing, and underinvestment in preventive health in Canada and internationally.

**Policy Implications.** Behavioural economics motivates a third approach to economic policy, beyond the standard toolkit of prices and information: **choice architecture** and **nudges** — designing the decision environment to steer people toward better outcomes without restricting freedom of choice. These themes are developed in Chapters 9 and 10.

---

## Glossary

**Allais Paradox.** A pair of choice problems designed by Maurice Allais (1953) that demonstrates systematic violation of the independence axiom of Expected Utility Theory. Most people choose in a way that cannot be reconciled with any expected utility function, because they overweight certain outcomes relative to probable outcomes (the certainty effect).
*Example:* Preferring a certain $1 million over a lottery with higher expected value (Problem A), while preferring the higher-expected-value lottery in a situation where certainty is unavailable (Problem B).
*Why it matters:* The most famous and replicable demonstration that EUT does not accurately describe human choice under uncertainty.

**Ambiguity Aversion.** The preference for options involving known probabilities (risk) over options involving unknown probabilities (ambiguity), even when the expected mathematical structure is equivalent. Demonstrated by the Ellsberg paradox.
*Example:* Preferring to bet on the colour of a ball drawn from an urn with known composition over an urn with unknown composition.
*Why it matters:* Explains home bias in investment, excess demand for familiar risks, and conservative behaviour in novel situations.

**Anchoring and Adjustment.** A heuristic in which people form numerical estimates by starting from an initial value (the anchor) and adjusting, usually insufficiently, to reach a final estimate. The initial value can be entirely arbitrary and irrelevant.
*Example:* People given the anchor "Is Canada's population more or less than 100 million?" give higher estimates than people given the anchor "Is it more or less than 10 million?"
*Why it matters:* Affects salary negotiations, price estimates, judicial sentences, and many other economically significant numerical judgements.

**Bounded Rationality.** The concept developed by Herbert Simon (1955) that human agents intend to make rational choices but are constrained by finite cognitive capacity, limited information, and limited time. Bounded rationality does not imply irrationality — it implies rationality within constraints.
*Example:* Choosing a university without researching every institution worldwide; searching until you find one that meets your criteria (satisficing).
*Why it matters:* Provides a realistic foundation for understanding why people use heuristics and make systematic errors, and why more options are not always better.

**Certainty Effect.** The tendency to overweight outcomes that are certain, relative to outcomes that are merely probable, even when the mathematical expectation favours the uncertain option.
*Example:* Preferring a certain $1 million over a lottery with an expected value of $1.39 million.
*Why it matters:* Generates violations of the independence axiom and explains one component of the Allais paradox.

**Cognitive Reflection Test (CRT).** A three-item test (Frederick 2005) designed to measure the tendency to override intuitive System 1 responses with deliberate System 2 reasoning. Low CRT scores predict present bias, overconfidence, and lower financial literacy.
*Example:* "A bat and ball cost $1.10 total. The bat costs $1.00 more than the ball. How much does the ball cost?" (System 1 answer: $0.10; correct answer: $0.05.)
*Why it matters:* Demonstrates that even simple problems elicit automatic wrong answers from highly educated people.

**Dual-Process Theory.** A theory of cognition that distinguishes between System 1 (fast, automatic, intuitive, effortless) and System 2 (slow, deliberate, analytical, effortful) modes of thinking. Many behavioural anomalies reflect the dominance of System 1 in contexts where System 2 correction fails.
*Example:* System 1 generates the intuitive (wrong) answer to CRT problems; System 2 must override it to reach the correct answer.
*Why it matters:* Provides a unified cognitive architecture explaining framing effects, loss aversion, overconfidence, and other departures from EUT.

**Ellsberg Paradox.** A pair of choice problems designed by Daniel Ellsberg (1961) demonstrating that people systematically prefer to bet on known probabilities (risk) over unknown probabilities (ambiguity), in a way that violates subjective expected utility theory.
*Example:* Preferring to bet on the red ball from an urn with known composition over the black ball from an urn with unknown composition, then also preferring to bet on black-or-yellow over red-or-yellow — an inconsistency.
*Why it matters:* Distinguishes risk from ambiguity as distinct sources of uncertainty, and shows that standard probabilistic models cannot accommodate ambiguity aversion.

**Expected Utility Theory (EUT).** The dominant model of rational decision-making under uncertainty, developed axiomatically by Von Neumann and Morgenstern (1944). Under EUT, a rational agent assigns a utility function over outcomes and maximises the probability-weighted average of utility across possible outcomes: $EU = \sum_i p_i \cdot u(x_i)$.
*Example:* A risk-averse agent with a concave utility function prefers a certain $50 over a 50-50 gamble between $100 and $0, because $u(\$50) > 0.5 u(\$100) + 0.5 u(\$0)$.
*Why it matters:* The benchmark model against which all behavioural departures are measured. Also a powerful tool for understanding financial markets, insurance, and risk management.

**Framing Effect.** The phenomenon in which choices between mathematically identical options reverse when those options are described differently. Introduced by Tversky and Kahneman (1981) through the Asian Disease Problem.
*Example:* Choosing the safe option (200 lives saved for certain) when options are described as gains, but the risky option (1/3 chance of saving all 600) when described as losses — even though the options are identical.
*Why it matters:* Demonstrates that preferences are defined over descriptions of outcomes, not just outcomes themselves, contradicting a core assumption of EUT.

**Heuristic.** A mental shortcut or rule of thumb used to make quick decisions without exhaustive calculation. Heuristics often work well but can produce systematic, predictable errors (biases) in specific circumstances.
*Example:* Judging the frequency of events by how easily examples come to mind (availability heuristic); estimating numerical quantities by adjusting from an initial anchor (anchoring heuristic).
*Why it matters:* Provides the cognitive mechanism linking bounded rationality to the specific biases observed in experiments.

**Hyperbolic Discounting.** A pattern of intertemporal preferences in which the discount rate between two periods declines as those periods move further into the future. Produces time-inconsistent preferences: the plan preferred at date 0 for dates 1 and 2 is different from the plan preferred at date 1 for the immediate future.
*Example:* Valuing $15 now over $50 in a year (implying a very high short-run discount rate), while being nearly indifferent between $50 in 10 years and $100 in 11 years (implying a much lower long-run discount rate).
*Why it matters:* Explains procrastination, undersaving, diet failures, and the gap between intended and actual behaviour.

**Independence Axiom.** The fourth axiom of Expected Utility Theory, which states that if you prefer lottery A to lottery B, then for any third lottery C and any probability p, you should prefer the mixture (A with probability p, C with probability 1-p) over (B with probability p, C with probability 1-p). Violated by the Allais paradox.
*Example:* If you prefer apple pie to chocolate cake, you should prefer "50% apple pie, 50% nothing" over "50% chocolate cake, 50% nothing."
*Why it matters:* The axiom that allows probabilities to "multiply through" in expected utility calculations. Its violation means EUT cannot accommodate certainty effects or common consequence effects.

**Loss Aversion.** The finding that losses are weighted approximately 2–2.5 times more heavily than equivalent gains in the value function. A central component of Prospect Theory (Kahneman and Tversky, 1979).
*Example:* Most people refuse a 50/50 gamble to win $150 or lose $100, despite its positive expected monetary value, because the psychological pain of losing $100 exceeds the psychological pleasure of gaining $150.
*Why it matters:* Explains the disposition effect in financial markets, resistance to nominal wage cuts, consumer price sensitivity, and many other economic phenomena.

**Present Bias.** The tendency to weight payoffs received in the immediate present disproportionately highly relative to payoffs received in the near or distant future, in a way that generates time-inconsistent preferences.
*Example:* Planning to start saving next month, then making the same plan again next month, and the month after, indefinitely.
*Why it matters:* Explains the gap between intended and actual savings, the prevalence of credit card debt alongside low savings rates, and procrastination in health behaviour.

**Satisficing.** Herbert Simon's concept describing how boundedly rational agents make decisions: rather than computing the globally optimal option, the agent searches until finding an option that meets a threshold level of acceptability (the aspiration level) and then stops.
*Example:* Accepting a job offer that pays well, has good benefits, and is in a desirable city — without researching every other job offer in existence.
*Why it matters:* A more realistic model of decision-making under cognitive constraints than full optimisation. Explains why people settle for "good enough" and stop searching even when better options might exist.

---

## References

Akerlof, G. A., Dickens, W. T., & Perry, G. L. (1996). The macroeconomics of low inflation. *Brookings Papers on Economic Activity*, 1, 1–76.

Allais, M. (1953). Le comportement de l'homme rationnel devant le risque: Critique des postulats et axiomes de l'école américaine. *Econometrica*, 21(4), 503–546.

Barber, B. M., & Odean, T. (2001). Boys will be boys: Gender, overconfidence, and common stock investment. *Quarterly Journal of Economics*, 116(1), 261–292.

Barber, B. M., & Odean, T. (2000). Trading is hazardous to your wealth: The common stock investment performance of individual investors. *Journal of Finance*, 55(2), 773–806.

Benartzi, S., & Thaler, R. H. (1995). Myopic loss aversion and the equity premium puzzle. *Quarterly Journal of Economics*, 110(1), 73–92.

Choi, J. J., Laibson, D., Madrian, B. C., & Metrick, A. (2009). Reinforcement learning and savings behavior. *Journal of Finance*, 64(6), 2515–2534.

Choi, J. J., Laibson, D., Madrian, B. C., & Metrick, A. (2010). Defined contribution pensions: Plan rules, participant choices, and the path of least resistance. *Tax Policy and the Economy*, 16, 67–113.

De Long, J. B., Shleifer, A., Summers, L. H., & Waldmann, R. J. (1990). Noise trader risk in financial markets. *Journal of Political Economy*, 98(4), 703–738.

Ellsberg, D. (1961). Risk, ambiguity, and the Savage axioms. *Quarterly Journal of Economics*, 75(4), 643–669.

Frederick, S. (2005). Cognitive reflection and decision making. *Journal of Economic Perspectives*, 19(4), 25–42.

Hardie, B. G. S., Johnson, E. J., & Fader, P. S. (1993). Modeling loss aversion and reference dependence effects on brand choice. *Marketing Science*, 12(4), 378–394.

Iyengar, S. S., & Lepper, M. R. (2000). When choice is demotivating: Can one desire too much of a good thing? *Journal of Personality and Social Psychology*, 79(6), 995–1006.

Kahneman, D. (2011). *Thinking, Fast and Slow*. Farrar, Straus and Giroux.

Kahneman, D., & Tversky, A. (1979). Prospect theory: An analysis of decision under risk. *Econometrica*, 47(2), 263–291.

Kahneman, D., & Tversky, A. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.

Laibson, D., Repetto, A., & Tobacman, J. (2001). A debt puzzle. In P. Aghion et al. (Eds.), *Knowledge, Information, and Expectations in Modern Macroeconomics*. Princeton University Press.

Mehra, R., & Prescott, E. C. (1985). The equity premium: A puzzle. *Journal of Monetary Economics*, 15(2), 145–161.

Rabin, M. (2000). Risk aversion and expected-utility theory: A calibration theorem. *Econometrica*, 68(5), 1281–1292.

Simon, H. A. (1955). A behavioral model of rational choice. *Quarterly Journal of Economics*, 69(1), 99–118.

Simon, H. A. (1957). *Models of Man: Social and Rational*. Wiley.

Svenson, O. (1981). Are we all less risky and more skillful than our fellow drivers? *Acta Psychologica*, 47(2), 143–148.

Thaler, R. H. (1980). Toward a positive theory of consumer choice. *Journal of Economic Behavior and Organization*, 1(1), 39–60.

Thaler, R. H. (1981). Some empirical evidence on dynamic inconsistency. *Economics Letters*, 8(3), 201–207.

Thaler, R. H., & Sunstein, C. R. (2003). Libertarian paternalism. *American Economic Review Papers and Proceedings*, 93(2), 175–179.

Thaler, R. H., & Sunstein, C. R. (2008). *Nudge: Improving Decisions about Health, Wealth, and Happiness*. Yale University Press.

Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.

Tversky, A., & Kahneman, D. (1992). Advances in prospect theory: Cumulative representation of uncertainty. *Journal of Risk and Uncertainty*, 5(4), 297–323.

Von Neumann, J., & Morgenstern, O. (1944). *Theory of Games and Economic Behavior*. Princeton University Press.

---

*End of Chapter 1*

---

> **Looking Ahead.** Chapter 2 examines the specific heuristics that bounded rational agents use in practice — representativeness, availability, and anchoring — and catalogues the systematic biases each produces. Chapter 3 presents Prospect Theory, the formal model of decision-making under uncertainty that replaces Expected Utility Theory and accounts for loss aversion, the certainty effect, and probability weighting.
