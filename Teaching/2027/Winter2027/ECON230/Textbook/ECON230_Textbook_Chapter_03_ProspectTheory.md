# Chapter 3: Gains, Losses, and the S-Curve — Prospect Theory

---

## Chapter Overview

The previous two chapters built a case against Expected Utility Theory (EUT): Chapter 1 catalogued the empirical violations — the Allais paradox, framing effects, loss aversion, and present bias — and Chapter 2 explained the cognitive machinery that generates them. But cataloguing failures is not enough. Science requires not just the demolition of an old model but the construction of a better one.

This chapter presents that better model: **Prospect Theory**, developed by Daniel Kahneman and Amos Tversky and first published in *Econometrica* in 1979. It is one of the most cited papers in all of economics and the primary intellectual foundation for which Kahneman received the Nobel Memorial Prize in Economic Sciences in 2002 (Tversky had died in 1996, and the Nobel is not awarded posthumously).

Prospect Theory replaces EUT's single utility function with a richer structure involving three interconnected components. First, outcomes are evaluated as **gains or losses relative to a reference point**, not as levels of final wealth. Second, a **value function** translates these gains and losses into subjective values in a way that is concave over gains (generating risk aversion for likely gains), convex over losses (generating risk seeking for likely losses), and systematically steeper in the loss domain than in the gain domain (generating loss aversion). Third, probabilities are not weighted linearly but through a **probability weighting function** that overweights small probabilities and underweights moderate-to-large ones.

Together, these three components generate what Kahneman and Tversky called the **four-fold pattern of risk attitudes** — the empirically observed pattern in which people are simultaneously risk-averse in some domains and risk-seeking in others. This chapter explains each component from first principles, presents the mathematical structure, and works through the applications that have made Prospect Theory so influential across economics, finance, health policy, and marketing.

---

## Learning Objectives

After studying this chapter, students should be able to:

1. **Describe** the four-fold pattern of risk attitudes and explain why Expected Utility Theory cannot accommodate it.
2. **Define** reference dependence and explain what determines the reference point in various economic contexts.
3. **State** the three key properties of the S-shaped value function and explain what each implies for risk attitudes.
4. **Write and interpret** the parametric form of the value function (Tversky and Kahneman, 1992) and calculate approximate values for simple gain and loss outcomes.
5. **Define** loss aversion, state the loss aversion coefficient $\lambda \approx 2.25$, and explain its implications across multiple economic settings.
6. **Explain** the endowment effect and its derivation from loss aversion, including the WTA/WTP gap.
7. **Describe** the probability weighting function — its shape, the certainty effect, and the possibility effect — and explain how it produces the four-fold pattern.
8. **State** the Cumulative Prospect Theory (CPT) value formula and explain why the 1992 refinement was necessary.
9. **Apply** Prospect Theory to explain the disposition effect, housing market stickiness, wage rigidity, insurance and lottery demand, and health behaviour.
10. **Explain** the equity premium puzzle and the myopic loss aversion solution proposed by Benartzi and Thaler (1995).

---

## Introduction: Why One Model Cannot Have It Both Ways

Consider three simple decisions. Write your own answers before reading on.

**Problem 1.** Choose between:
- Option A: Win $900 with certainty.
- Option B: A 90% chance of winning $1,000 and a 10% chance of winning nothing.

**Problem 2.** Choose between:
- Option A: Lose $900 with certainty.
- Option B: A 90% chance of losing $1,000 and a 10% chance of losing nothing.

**Problem 3.** You currently have $2,000. Choose between:
- Option A: Lose $500 with certainty.
- Option B: A 50% chance of losing $1,000.

If your answers followed the typical pattern — A in Problem 1, B in Problem 2, and B in Problem 3 — you are in good company. Kahneman and Tversky found that approximately 84% of respondents chose A in Problem 1, 87% chose B in Problem 2, and 69% chose B in Problem 3.

Now notice the contradiction with standard theory. In Problem 1, both options have the same expected monetary value ($900), yet most people take the certain option — they are **risk averse**. In Problem 2, both options again have the same expected monetary value (–$900), yet now most people take the gamble — they are **risk seeking**. The only change between Problem 1 and Problem 2 is the sign: gains were replaced by losses.

A single concave utility function — the standard EUT model of risk aversion — cannot produce both results. If you are risk averse over gains, the concavity of your utility function should make you also risk averse over losses. The evidence says otherwise, and the pattern is not random: it is systematic across populations and cultures.

Problem 3 adds a further wrinkle. Here the certain option (lose $500) and the gamble (50% chance of losing $1,000) have the same expected value, but the problem is framed in terms of final wealth ($2,000 as starting point). Many people who would readily accept losing $500 for certain in an abstract context choose the gamble when the loss is framed against a pre-existing wealth level. The reference point matters.

This chapter builds the theoretical framework that explains all three results: Prospect Theory.

---

## 1. The Failure of Expected Utility Theory: The Four-Fold Pattern

Before building the new model, it is useful to be precise about what EUT predicts and exactly how the evidence contradicts it.

### 1.1 What EUT Predicts

With a single concave utility function $u(w)$, where $w$ denotes final wealth, EUT predicts that a risk-averse agent will:
- Always prefer a certain outcome to a gamble with the same expected monetary value.
- Be risk averse over both gains and losses.
- Make decisions based solely on final wealth levels — the path that led to those levels is irrelevant.
- Assign the same utility to a given wealth level regardless of whether it was reached via a gain or a loss.

The last two predictions are what EUT calls **consequentialism** and **asset integration**: preferences are over final states, and all wealth is fungible. A person with $1,000 in wealth, regardless of whether they started with $500 and gained $500 or started with $1,500 and lost $500, should have the same preferences.

### 1.2 What the Data Show: The Four-Fold Pattern

Kahneman and Tversky's experiments revealed a dramatically different picture. The empirical pattern of risk attitudes follows a **four-fold structure** that depends on two dimensions: whether the outcomes are gains or losses, and whether the probabilities involved are high or low.

**Table 3.1: The Four-Fold Pattern of Risk Attitudes**

| | **Gains** | **Losses** |
|---|---|---|
| **High Probability** | **Risk Averse** — Prefer the certain gain over the gamble. *"Lock in the win."* | **Risk Seeking** — Prefer the gamble over the certain loss. *"Roll the dice to avoid the loss."* |
| **Low Probability** | **Risk Seeking** — Prefer the gamble over a certain small gain. *"Dream big — buy a lottery ticket."* | **Risk Averse** — Prefer the certain small loss (insurance premium) over the gamble of a large loss. *"Protect against disaster."* |

This four-fold structure — with two cells showing risk aversion and two showing risk seeking — cannot be produced by any single concave or convex utility function. A concave function would predict risk aversion in all four cells; a convex function would predict risk seeking in all four. The only way to accommodate the pattern is with a theory that has fundamentally different structure from EUT.

Two features of the value function (risk attitude in the high-probability cells) and the probability weighting function (risk attitude in the low-probability cells) together produce the four-fold pattern. We develop each in turn.

### 1.3 Framing Effects and the Failure of Asset Integration

A second fundamental failure of EUT is the inability to account for framing effects. Recall from Chapter 1 the Asian Disease Problem (Kahneman and Tversky, 1981): mathematically identical options — 200 certain survivors versus a 1/3 chance of 600 survivors — were chosen by different majorities when described as "lives saved" versus "deaths."

Under EUT, the description is irrelevant. The utility of 200 certain survivors (which is also the utility of 400 certain deaths from a population of 600) is a fixed number, independent of how the problem is stated. The experimental finding that 72% choose the certain option in the gain frame but 78% choose the risky option in the loss frame is not a rounding error or measurement noise — it is a systematic, replicable pattern that has been reproduced in dozens of countries.

The key insight: people do not evaluate outcomes as absolute levels (final wealth, total lives saved) but as deviations from a reference point (the 600 people currently threatened). Whether something is coded as a gain or a loss relative to that reference determines the entire structure of preferences. This is the concept of **reference dependence** — the first pillar of Prospect Theory.

---

## 2. Reference Dependence: The First Pillar

### 2.1 The Core Idea

The most fundamental departure of Prospect Theory from EUT is that the value function is defined over **changes** from a reference point, not over final levels of wealth. Formally, if the reference point is $r$ and the outcome is $w$, the relevant quantity is $x = w - r$: positive $x$ is a gain, negative $x$ is a loss, and $x = 0$ is the status quo.

This has radical implications. The same final wealth level $w = \$1,000$ can feel like a gain (if your reference point is $r = \$800$) or a loss (if your reference point is $r = \$1,200$). Your reference point determines how you feel about where you are — and therefore what decisions you will make.

This is not a minor modelling choice. It overthrows the EUT principle that all that matters is where you end up. In Prospect Theory, where you end up *relative to where you expected to end up* is what drives decision-making.

### 2.2 What Determines the Reference Point?

If reference points are so important, what determines them? Kahneman and Tversky identified several candidates:

**The status quo.** The most common reference point is simply the current state of affairs. A person with $1,000 in savings evaluates proposed changes relative to $1,000. A homeowner evaluates their home's market value relative to what they paid for it (or in some cases, against its peak value). The status quo is the default reference in most economic situations.

**Expectations.** The reference point can also be what a person expected to receive, rather than what they currently have. A worker who expected a $1,000 bonus and receives $800 may experience the outcome as a $200 loss — even though, relative to their pre-bonus wealth, they are $800 richer. This expectation-based reference point is consistent with evidence on worker satisfaction following announcements of bonuses or wage changes.

**Social comparisons.** What peers receive can serve as a reference point. An employee who receives a $5,000 raise while observing a colleague receive $10,000 may experience the outcome as a relative loss — which helps explain why inequality within organisations affects morale even when absolute compensation is adequate. This is explored further in Chapter 6 on social preferences.

**Targets and budgets.** In financial and athletic contexts, explicitly stated targets (a quarterly sales target, a time goal in a race) serve as reference points. Research on professional golfers by Pope and Schweitzer (2011) showed that golfers putt more accurately for par than for birdie — because missing par is coded as a loss while missing birdie is merely a foregone gain, and loss aversion increases the effort devoted to par putts.

**The malleability of the reference point** has important implications for marketing and negotiation. By controlling what a consumer or counterparty treats as their reference point, an adversary can systematically alter their willingness to pay.

> **Box 3.1: Retailers and the Reference Point**
>
> One of the most pervasive applications of reference dependence is the practice of displaying a "compare at" price — "Was $200, now $79." Whether or not the $200 represents a price at which the item was ever seriously offered for sale, it establishes the consumer's reference point. The $79 price is then evaluated not on its own terms (is $79 fair value for this item?) but relative to the $200 anchor: it is a $121 gain compared to the reference.
>
> This practice is so widespread precisely because it is so effective. The consumer's willingness to pay is shifted upward by the higher reference point, and the perception of "savings" generates positive affect that supports the purchase decision. Regulators in several jurisdictions — including the Canadian Competition Bureau — have investigated and in some cases penalised retailers for maintaining fictitious "regular" prices for the purpose of inflating consumers' reference points.

---

### 2.3 Reference Points in Labour Markets

Some of the most economically consequential applications of reference dependence involve labour markets, where the reference point is typically the nominal wage.

**Nominal Wage Rigidity.** Akerlof, Dickens, and Perry (1996) observed that nominal wages are extraordinarily sticky in the downward direction. Employers almost never cut nominal wages, even in recessions when market-clearing wages should fall. Instead, they tend to respond to adverse shocks by freezing nominal wages (accepting a real wage cut through inflation) or by laying off workers rather than reducing wages for those who remain.

This pattern is exactly what reference dependence predicts. Workers take their current nominal wage as their reference point. A nominal wage cut is experienced as a loss — crossing below the reference point into the loss domain. Even a small real wage cut achieved through a nominal cut is perceived as categorically different from the same real cut achieved through inflation holding the nominal wage constant. A 3% real wage reduction achieved by freezing the nominal wage during 3% inflation is a point on the zero line (no nominal change from reference); a 3% real wage cut achieved by directly cutting the nominal wage by 3% is a point in the loss domain. Same real effect; entirely different psychological experience.

Shafir, Diamond, and Tversky (1997) provided striking survey evidence of this. When asked to evaluate scenarios, workers preferred a nominal raise of 5% during 12% inflation (equivalent to a 7% real wage cut) over a nominal raise of 2% during 4% inflation (equivalent to a 2% real wage cut). The preferred scenario left workers substantially worse off in real terms — because they were evaluating nominal gains, not real ones.

**Canadian Evidence.** During the Canadian inflation spike of 1974–1980, when average CPI inflation ran at approximately 9% per year, nominal wages rose by 10–12% annually. Employers found that maintaining nominal wage growth above zero — even when real wages were essentially stagnant — preserved industrial peace and reduced turnover. The workers were anchoring on the nominal number and experiencing it as a gain, even though their purchasing power was barely keeping pace with inflation.

---

## 3. Loss Aversion: The Second Pillar

### 3.1 The Core Finding

The second pillar of Prospect Theory is **loss aversion**: the finding that losses hurt more than equivalent gains feel good. In quantitative terms, the psychological impact of losing $X is approximately 2 to 2.5 times larger than the psychological impact of gaining the same amount $X.

This parameter is estimated as the **loss aversion coefficient** $\lambda$:

$$\lambda = \frac{|v(-x)|}{v(x)} \approx 2.25 \quad \text{for } x > 0$$

meaning that the value of a loss of magnitude $x$ is approximately 2.25 times larger in absolute terms than the value of an equivalent gain.

The empirical basis for this estimate comes from multiple sources. Tversky and Kahneman (1992) estimated $\lambda \approx 2.25$ from calibrating the value function to a large body of experimental choice data. Independent estimates from market data — consumer purchases (Hardie, Johnson, and Fader, 1993: $\lambda \approx 2.4$), labour market behaviour, and financial asset pricing — consistently yield values in the range of 1.5 to 2.5.

### 3.2 Intuition for Loss Aversion

Why is loss aversion a coherent feature of preferences, and not simply an error? There are two complementary explanations.

**The hedonic asymmetry argument.** Evolutionary arguments suggest that losses — of food, shelter, social standing, physical safety — were historically more consequential than equivalent gains. An organism that responds more urgently to the loss of a resource than to its acquisition may be better adapted to survival. The same asymmetry, applied in modern financial contexts, generates loss aversion.

**The Rabin critique of diminishing marginal utility.** A subtler argument, due to Rabin (2000), shows that loss aversion cannot be explained by the concavity of the utility function over final wealth. A famous calibration theorem shows that if a person refuses a 50/50 gamble to gain $150 or lose $100 (a common finding), then a globally concave utility function implies they would also refuse a 50/50 gamble to gain $10,000 or lose $200 — a prediction that no one would accept. The curvature of the utility function cannot generate strong loss aversion for small-stakes gambles without generating absurd degrees of risk aversion for large-stakes gambles. Loss aversion must therefore be a kink at the reference point — a local asymmetry — rather than a global feature of the utility function.

### 3.3 Loss Aversion Across Domains

Loss aversion has been documented in a remarkably wide range of economic settings:

**Consumer markets.** Hardie, Johnson, and Fader (1993) analysed scanner data on consumer butter purchases. When prices rose above the reference price (a loss), consumers reduced purchases by approximately 2.4 times as much as they increased purchases when prices fell by the same amount (a gain). The loss aversion coefficient estimated from market data matched Kahneman and Tversky's laboratory estimate closely.

**Financial markets.** Loss aversion drives the **disposition effect** (discussed in Section 6): investors hold losing stocks too long and sell winning stocks too quickly because selling a winner locks in a gain (moderately pleasurable) while selling a loser realises a loss (strongly painful). It also contributes to the **equity premium puzzle**: stocks must offer much higher expected returns than bonds to compensate investors who evaluate outcomes annually and experience the frequent volatility of stocks as a series of painful losses.

**Labour markets.** Fryer, Levitt, List, and Sadoff (2012) ran a randomised controlled trial of teacher incentive pay programmes. Teachers assigned to a loss-framed contract — where they received the bonus upfront and had to "give back" money if their students did not meet targets — improved student test scores significantly more than teachers assigned to an equivalent gain-framed contract — where they received the bonus at year-end if targets were met. Same financial incentive; dramatically different impact, because the loss frame made the cost of underperformance feel more painful.

**Animal behaviour.** Chen, Lakshminarayanan, and Santos (2009) trained capuchin monkeys to participate in market exchange using tokens. They found that monkeys exhibited clear loss aversion in a paradigm where they could choose between a safe option and a gamble: given a choice between outcomes that were mathematically equivalent, monkeys consistently chose to avoid the option framed as a loss. This finding — that non-human primates share loss aversion — suggests it is a deep feature of the primate reward system rather than a learned cultural attitude.

---

## 4. The S-Shaped Value Function: The Third Pillar

### 4.1 Properties of the Value Function

The value function $v(x)$, where $x$ denotes a gain (if positive) or a loss (if negative) relative to the reference point, must capture both loss aversion and the four-fold pattern of risk attitudes. Kahneman and Tversky (1979) showed that the following three properties are sufficient:

**Property 1: Reference dependence.** The value function is defined over gains and losses $x = w - r$ (changes from a reference point $r$), not over final wealth $w$. The reference point receives value zero: $v(0) = 0$.

**Property 2: Concavity in gains; convexity in losses.** For positive $x$ (gains), $v$ is concave: $v''(x) < 0$ for $x > 0$. For negative $x$ (losses), $v$ is convex: $v''(x) > 0$ for $x < 0$.

This means:
- In the gain domain, each additional dollar of gain produces *less* additional value than the previous dollar — consistent with diminishing marginal utility and generating risk aversion over gains.
- In the loss domain, each additional dollar of loss produces *less* additional pain than the previous dollar. The pain diminishes as losses grow — generating risk seeking over losses. This is sometimes expressed as: the first $100 of loss hurts most; subsequent losses hurt less as we psychologically adapt.

**Property 3: Loss aversion.** The function is steeper for losses than for gains. For any $x > 0$: $|v(-x)| > v(x)$. The slope of the value function is steeper in the loss domain than in the gain domain, capturing the fact that losses matter more than equivalent gains.

Together, these properties generate the **S-shaped value function**: concave and gently sloping for gains, convex and steeply sloping for losses, with a kink at the reference point where the slope discontinuously increases as one crosses from gains to losses.

### 4.2 The Parametric Form

Tversky and Kahneman (1992) provided a specific parametric form for the value function that fits the experimental data:

$$v(x) = \begin{cases} x^\alpha & \text{if } x \geq 0 \\ -\lambda(-x)^\beta & \text{if } x < 0 \end{cases}$$

with empirically estimated parameters:
- $\alpha = \beta = 0.88$ (the curvature of the function, capturing diminishing sensitivity in both domains)
- $\lambda = 2.25$ (the loss aversion coefficient)

**Interpreting the parameters:**

The exponent $\alpha = \beta = 0.88$ means that the value function is a power function, slightly concave in gains and slightly convex in losses. The fact that both exponents are less than 1 but close to 1 means the function is not very curved — the diminishing sensitivity is real but moderate.

The coefficient $\lambda = 2.25$ multiplies the entire loss side of the function, stretching it downward by a factor of 2.25. This means a loss of $x$ generates 2.25 times the absolute value of a gain of $x$ — precisely the loss aversion finding.

**Example calculations:**
- $v(+50) = 50^{0.88} \approx 36$
- $v(-50) = -2.25 \times 50^{0.88} \approx -81$
- Ratio: $|v(-50)| / v(+50) \approx 2.25$ ✓

This example illustrates the asymmetry concretely: a gain of $50 and a loss of $50 have the same absolute magnitude in money, but their subjective values differ by a factor of 2.25. The loss feels more than twice as bad as the gain feels good.

### 4.3 Figure: The S-Shaped Value Function

**Figure 3.1: The Prospect Theory Value Function**

```
  v(x) ↑
       │                              ·····  Gain domain
  +80  ┤                         ·····       (concave — risk averse)
       │                    ·····
  +40  ┤               ·····
  +36  ┤          ·····  ← v(+50) ≈ +36
       │     ·····
       │·····
     0 ┼───────────────────────────────────────────────→ x
  −50  0    +50   GAINS →
  Loss domain ←
       │·····
  −40  ┤     ·····   Convex — risk seeking for losses
       │          ·····
  −81  ┤               ·····  ← v(−50) ≈ −81
       │                    ·····   Loss domain is STEEPER
 −120  ┤                         ·····  (loss aversion λ ≈ 2.25)
       │
       │  ◄──────────────────────────────────────────────►
       │       LOSSES (x < 0)          GAINS (x > 0)
       │
       │  Diminishing sensitivity:    Diminishing sensitivity:
       │  each extra $ loss hurts      each extra $ gain pleases
       │  less at the margin           less at the margin
       │
       │  But overall: |v(−50)| / v(+50) = 81/36 ≈ 2.25
       │  → LOSS AVERSION: losses loom larger than equal gains
```

| | Description |
|---|---|
| **What the figure shows** | A graph with monetary outcomes on the horizontal axis (negative values to the left representing losses, positive values to the right representing gains) and subjective value on the vertical axis. The origin (0,0) is the reference point. For gains (right of origin), the curve rises in a concave arc — steep at first, then flattening. For losses (left of origin), the curve falls steeply at first, then flattens, tracing a convex arc. Crucially, the loss side is steeper overall than the gain side, reflecting loss aversion. |
| **Specific numbers** | Using the parametric form with $\alpha = \beta = 0.88$ and $\lambda = 2.25$: a gain of $50 produces a value of approximately 36, while a loss of $50 produces a value of approximately −81 — a ratio of 2.25, confirming loss aversion. |
| **How to interpret it** | The concavity in gains produces risk aversion for likely gains (you prefer the certain gain to the gamble). The convexity in losses produces risk seeking for likely losses (you prefer the gamble to the certain loss). The steepness difference (loss aversion) drives the kink at the reference point and generates a host of economic phenomena including the endowment effect, disposition effect, and wage rigidity. |
| **Key features to identify** | (1) The reference point at the origin. (2) The concave green curve in the gain domain. (3) The convex red curve in the loss domain, which is steeper. (4) The S-shape formed by the two curves together. |

**Reading the diagram: the four-fold pattern**

The shape of the value function directly produces two of the four cells:
- **High probability, gains → Risk averse:** The concavity of the value function over gains means that $v(\$1000 \times 0.9) < 0.9 \times v(\$1000)$. The marginal utility of the expected gain diminishes, making the certain option more attractive. People lock in the certain gain.
- **High probability, losses → Risk seeking:** The convexity of the value function over losses means that $|v(-\$1000 \times 0.9)| > 0.9 \times |v(-\$1000)|$. The marginal pain of the expected loss diminishes, making the certain loss feel worse relative to the gamble. People prefer the gamble to avoid crystallising the certain loss.

The other two cells (low probability) require the probability weighting function, discussed in Section 5.

---

## 5. The Endowment Effect: Loss Aversion in Ownership

### 5.1 WTA versus WTP

Loss aversion implies a fundamental and far-reaching asymmetry in the economics of exchange: the price at which a person is willing to **sell** an object they own should exceed the price at which they are willing to **buy** the same object.

Why? Selling an owned object is experienced as a **loss** — the object is being taken from you, and its departure is evaluated in the loss domain of the value function, where the curve is steep. Acquiring the same object is experienced as a **gain** — the object is coming to you — evaluated in the gain domain, where the curve is flatter. Since the loss domain is steeper by a factor of approximately $\lambda = 2.25$, the minimum selling price (willingness to accept, WTA) will systematically exceed the maximum buying price (willingness to pay, WTP) — not because the object has changed, but because ownership changes the reference point.

Standard economics predicts WTA = WTP for any given good, at least for goods that are not sources of direct utility (like collector's items) and in liquid markets. The **endowment effect** — the systematic excess of WTA over WTP — is a violation of this prediction.

> **Research Study: The Mug Experiment**
>
> **Researchers:** Daniel Kahneman, Jack Knetsch, and Richard Thaler
> **Year:** 1990
> **Research Question:** Does ownership of an object increase its subjective value relative to not owning it?
> **Method:** Approximately half the students in each experimental session were randomly given an ordinary coffee mug (university-branded, retailing for approximately $6). The other half received nothing. After the mugs were distributed, students were given the opportunity to trade: mug owners ("sellers") stated the minimum price at which they would be willing to sell their mug; non-owners ("buyers") stated the maximum price they would be willing to pay to acquire one.
> **Results:** Sellers required a median price of $7.12 to part with their mug. Buyers were willing to pay a median of $2.87 for one. The same physical object commanded a price ratio of approximately 2.5:1 depending solely on whether the person owned it or not — consistent with $\lambda \approx 2.25$.
> **Economic Interpretation:** The prediction of EUT (and standard supply-and-demand theory) is that the mugs should trade freely — roughly half the mugs should change hands as sellers with low attachment sell to buyers with high attachment. Instead, very few trades occurred, because almost every seller's reservation price exceeded almost every buyer's willingness to pay.
> **Behavioural Insight:** The mug experiment demonstrates that merely owning an object changes its reference point: the object's departure is now a loss, whereas its acquisition would be a gain. The loss looms larger, producing the WTA > WTP gap.

### 5.2 Economic Consequences of the Endowment Effect

**Housing markets.** The endowment effect interacts powerfully with housing markets, where the purchase price establishes a strong reference point. Genesove and Mayer (2001) analysed condominium sales in downtown Boston during the early 1990s housing market decline. They found that homeowners who faced a nominal loss (their estimated market value fell below their purchase price) listed their condominiums at significantly higher asking prices than owners with equity — and took substantially longer to sell. The data showed that loss-averse sellers were essentially demanding a premium to crystallise a loss, even at the cost of a prolonged period with the asset unsold.

**Canadian Housing 2022–2023.** The Canadian housing market provides a vivid recent illustration. Following the Bank of Canada's interest rate increases from 0.25% to 5.00% between March 2022 and July 2023, national average home prices fell approximately 18% from their February 2022 peak. Sellers who had purchased near the 2022 peak faced a stark choice: accept a nominal loss or hold on and wait. Multiple listing service (MLS) data for this period show that properties listed by peak-period buyers spent approximately 47 days on market on average, compared to 21 days for sellers who had purchased earlier and retained positive equity. Many peak-period sellers withdrew their listings entirely rather than accept an offer below their purchase price — a market-level manifestation of loss aversion generating price stickiness and reduced trading volume.

**Policy and welfare reform.** The endowment effect complicates the design of social policy reforms. When a policy change involves taking away an existing benefit, even to replace it with a different benefit of equal or greater monetary value, the recipients of the existing benefit experience the change as a loss. Reforms that simultaneously eliminate an old benefit and introduce a new one typically encounter fierce resistance from current beneficiaries even when the net change is positive — precisely because the loss of the familiar benefit looms larger than the gain of the new one.

**Labour markets and layoffs.** Workers who lose their jobs experience the loss of their employment as being in the loss domain — and the evidence on displaced worker welfare shows that job loss produces large, persistent declines in reported well-being that go well beyond what income losses alone would predict (Davis and Wachter, 2011). The reference point of the lost job generates a psychological cost that persists even when re-employment at similar wages is achieved.

---

## 6. The Disposition Effect: Prospect Theory in Financial Markets

### 6.1 The Pattern

The **disposition effect** is the tendency of investors to sell assets that have increased in value (winners) and hold assets that have decreased in value (losers) relative to their purchase price. This name was coined by Shefrin and Statman (1985), who predicted the pattern from Prospect Theory before the data were collected.

The mechanism is directly predicted by the S-shaped value function:
- A stock trading above its purchase price is in the **gain domain** of the value function, where the curve is concave. In this region, investors are risk averse: they prefer to lock in the certain gain by selling rather than hold the stock and risk it falling back. The psychic value of the certain gain exceeds the expected value of holding.
- A stock trading below its purchase price is in the **loss domain**, where the curve is convex. In this region, investors are risk seeking: they prefer to hold the stock (gamble on a recovery) rather than sell and crystallise the certain loss. The psychic pain of the certain loss exceeds the expected cost of holding.

Both responses have the same psychological origin — loss aversion combined with the asymmetric curvature of the value function — but they produce opposite trading behaviours depending on whether the stock is a winner or a loser relative to the purchase price.

> **Research Study: Are Investors Reluctant to Realise Their Losses?**
>
> **Researcher:** Terrance Odean
> **Year:** 1998
> **Research Question:** Do individual investors exhibit the disposition effect — selling winners and holding losers?
> **Method:** Odean analysed a dataset of 10,000 brokerage accounts tracking individual investor trading from 1987 to 1993. For each sale, he identified whether the stock was a "winner" (current price above purchase price) or "loser" (current price below purchase price). He then computed the "proportion of gains realised" (PGR) and "proportion of losses realised" (PLR).
> **Results:** The PGR was 14.8% — investors sold 14.8% of their paper-gain positions in any given period. The PLR was only 9.8% — they sold just 9.8% of their paper-loss positions. Investors were 52% more likely to realise gains than equivalent losses. The only period in which this pattern reversed was December, when tax-loss harvesting creates incentives to realise losses.
> **Economic Interpretation:** The disposition effect costs investors approximately 3.4% in annual returns through a combination of two channels: (1) winning stocks that were sold continued to outperform losing stocks that were held, so the trading itself was counter-productive; (2) realising gains creates taxable events while holding losses defers them — exactly the opposite of what tax efficiency would recommend.
> **Behavioural Insight:** The disposition effect demonstrates that the purchase price acts as a salient reference point in financial decision-making. Rational investors should ignore it as a sunk cost. Loss-averse investors cannot.

**Figure 3.2: The Disposition Effect in Practice**

```
  Proportion
  Realised ↑    Odean (1998): 10,000 brokerage accounts, 1987–1993
            │
   20%    ──┤
            │  ████████████████████
   14.8%  ──┼──████████████████████──────────────────────────
            │  ████████████████████
            │  ████████████████████
   10%    ──┤  ████████████████████
            │  ████████████████████  ██████████████
    9.8%  ──┼──████████████████████──██████████████──────────
            │  ████████████████████  ██████████████
            │  ████████████████████  ██████████████
    5%    ──┤  ████████████████████  ██████████████
            │  ████████████████████  ██████████████
    0%    ──┴──────────────────────────────────────────────→
                   PGR                    PLR
           (Proportion of Gains   (Proportion of Losses
              Realised = 14.8%)      Realised = 9.8%)

  Investors are 52% MORE likely to sell a winning stock
  than an equivalent losing stock.
  Under rational model: PGR should equal PLR.
  Gap = Disposition Effect driven by loss aversion.
```

| | Description |
|---|---|
| **What the figure shows** | A bar chart comparing PGR (proportion of gains realised = 14.8%) and PLR (proportion of losses realised = 9.8%). The PGR bar is teal; the PLR bar is red. |
| **How to interpret it** | The gap between the bars — a 52% difference in sell rates depending on whether the position is a winner or loser — is attributable to the disposition effect. Both bars should be equal under the null hypothesis that past returns (relative to purchase price) are irrelevant to the sell decision. The gap estimates the economic cost of treating the purchase price as a reference point. |

The disposition effect has been documented far beyond individual US brokerage accounts. Grinblatt and Keloharju (2001) found it in Finnish investors; Shapira and Venezia (2001) in Israeli investors; Choe and Eom (2009) in South Korean institutional investors. The pattern appears to be universal.

---

## 7. The Probability Weighting Function

### 7.1 The Failure of Linear Probability Weighting

In Expected Utility Theory, probabilities enter the calculation linearly: doubling the probability of an outcome exactly doubles its contribution to expected utility. There is nothing psychologically special about a probability of 0.99 compared to 0.98, or about 0.01 compared to 0.02 — each change of 0.01 in probability has the same impact on the expected utility calculation.

This prediction is also empirically violated. People treat qualitative probability thresholds — particularly certainty (probability = 1) and impossibility (probability = 0) — as psychologically special in ways that probability shifts in the interior of [0,1] are not.

The clearest demonstration is the **certainty effect**: the disproportionate weight people assign to outcomes that are certain relative to outcomes that are merely probable. From Chapter 1: people prefer $2,400 for certain over a gamble with a higher expected value ($2,500 × 0.33 = $825 > $2,400 × 1 = $2,400; wait, let's use the version from the lecture: $2,400 certain vs $2,500 at 33% probability). But the same majority prefers the $2,500 at 33% probability over $2,400 at 34% probability. The drop from 100% to 99% feels enormous; the drop from 34% to 33% feels negligible — even though both are mathematically equivalent changes of one percentage point.

This asymmetry cannot be explained by the value function alone. We need a second component: a function that transforms objective probabilities into subjective decision weights.

### 7.2 The Probability Weighting Function

The probability weighting function $\pi(p)$ maps an objective probability $p \in [0,1]$ to a subjective decision weight $\pi(p) \in [0,1]$. It has the following key properties established by the empirical evidence:

1. $\pi(0) = 0$ and $\pi(1) = 1$: impossible events receive zero weight; certain events receive full weight.
2. **Overweighting of small probabilities:** $\pi(p) > p$ for small $p$. People treat small possibilities as if they were more likely than they actually are.
3. **Underweighting of moderate-to-large probabilities:** $\pi(p) < p$ for most intermediate and large values of $p$. People treat moderately likely outcomes as if they were less likely than they are.
4. **The inverse-S shape:** The weighting function crosses the diagonal (where $\pi(p) = p$) at approximately $p \approx 0.3–0.4$, below which $\pi(p) > p$ (overweighting) and above which $\pi(p) < p$ (underweighting).
5. **Subadditivity near the endpoints:** Small changes near $p = 0$ and $p = 1$ have disproportionately large effects on decision weights relative to equivalent changes in the interior of [0,1].

A widely used parametric form, due to Prelec (1998), is:

$$\pi(p) = \exp(-(-\ln p)^\gamma)$$

where $\gamma \approx 0.65$ (Tversky and Kahneman, 1992) controls the curvature. When $\gamma = 1$, the function is the identity ($\pi(p) = p$, the EU case). Values of $\gamma < 1$ produce the inverse-S shape.

**Figure 3.3: The Probability Weighting Function**

```
  π(p) ↑   Decision weight vs. objective probability
  1.0  ┤                                          ●
       │                                    ·····/
       │                              ·····/
  0.8  ┤                        ·····/  ← Underweighting
       │                  ·····/          large probs
       │            ·····/ ╌╌╌╌╌╌╌╌ π(0.7) ≈ 0.56 < 0.70
  0.56 ┤ ·        ●╌╌╌╌╌╌╌╌╌           (below diagonal)
       │ ·· ╌╌╌╌╌╌╌   ╌╌╌
  0.4  ┤·╌╌╌╌ Crossover at p ≈ 0.35
       │╌ ←  π(p) = p here
  0.38 ┤●·· ← π(0.3) ≈ 0.38 > 0.30   (above diagonal)
       │  ··  Overweighting small probs
  0.2  ┤   ··
       │    ·· ← inverse-S curve (solid)
       │     ╌╌ ← 45° diagonal (dashed) = EUT linear weighting
    0  ┼────┬────┬────┬────┬────┬────┬────┬────┬────┬────→ p
       0   0.1  0.2  0.3  0.4  0.5  0.6  0.7  0.8  0.9  1.0
            ↑                   ↑                        ↑
      Overweighting        Crossover               Underweighting
      small chances       (~p = 0.35)             large chances
      (lottery effect)                          (certainty effect)

  ·····  = π(p): Prelec (1998) with γ ≈ 0.65
  ╌╌╌╌╌  = 45° diagonal: EUT (π(p) = p)
```

| | Description |
|---|---|
| **What the figure shows** | The probability weighting function $\pi(p)$ plotted against the objective probability $p$. The dashed diagonal represents linear probability weighting (EUT). The solid purple curve traces the inverse-S shape: it lies above the diagonal for small $p$ (overweighting) and below for large $p$ (underweighting), with a crossover at approximately $p = 0.35$. |
| **Key annotations** | At $p = 0.3$: $\pi(0.3) \approx 0.38 > 0.3$ (overweighted). At $p = 0.7$: $\pi(0.7) \approx 0.56 < 0.7$ (underweighted). The function is steep near 0 and 1, flat in the middle. |
| **How to interpret it** | The steep slope near zero means that the difference between "impossible" and "very unlikely" feels large — turning a zero-probability event into a 1% probability is psychologically significant. Similarly, the steep slope near 1 means that the difference between "certain" and "99% likely" feels large — the certainty premium. These are the qualitative leaps that generate the certainty effect and the possibility effect. |

### 7.3 Two Psychological Effects

Two qualitative features of the probability weighting function generate distinct economic phenomena:

**The Certainty Effect.** The disproportionate weight assigned to certainty ($p = 1$) relative to near-certainty ($p = 0.99$) generates the certainty premium: people pay more than expected value to secure a certain outcome. This explains:
- The Allais paradox (Chapter 1): the certain $1 million in Problem A is disproportionately attractive not because of its expected value but because of its certainty.
- Consumer preference for "guaranteed" returns over slightly higher expected returns with small variance.
- Insurance demand: people pay premiums that exceed actuarial fair value to achieve certainty of coverage.

**The Possibility Effect.** The disproportionate weight assigned to small non-zero probabilities relative to zero generates the possibility premium: people pay more than expected value for a small chance at a large prize. This explains:
- Lottery demand: the expected monetary value of a lottery ticket is always negative, yet hundreds of millions of people worldwide regularly purchase them. The overweighting of the small winning probability generates a decision weight that exceeds the mathematical probability.
- The purchase of very small insurance policies covering unlikely but catastrophic risks: people will pay significant premiums for earthquake, flood, or nuclear accident coverage even when the expected loss is very small.

### 7.4 The Four-Fold Pattern: Complete Explanation

Combining the value function (Section 4) and the probability weighting function produces the complete four-fold pattern:

**High probability, gains → Risk averse.** When a gain is highly probable, $\pi(p) < p$: the high probability is underweighted. The certain equivalent is overweighted by a factor proportional to the certainty effect. The result: people prefer the certain gain.

**High probability, losses → Risk seeking.** When a loss is highly probable, $\pi(p) < p$: the high probability is underweighted. The certain loss looms large (loss aversion), but the small probability of avoiding the loss is overweighted. The result: people prefer the gamble to the certain loss.

**Low probability, gains → Risk seeking.** When a gain is possible but unlikely, $\pi(p) > p$: the small probability is overweighted. This makes the distant possibility of a large gain feel more attractive than expected value alone would justify. The result: people purchase lottery tickets.

**Low probability, losses → Risk averse.** When a loss is possible but unlikely, $\pi(p) > p$: the small probability of a catastrophic loss is overweighted. People purchase insurance at premiums above actuarial fair value because the small probability of disaster feels subjectively larger than it actually is.

**Table 3.2: Generating the Four-Fold Pattern**

| Probability | Domain | Weight Relative to Objective | Risk Attitude | Example |
|---|---|---|---|---|
| High ($p > 0.35$) | Gain | $\pi(p) < p$ (underweighted) | Risk Averse | Prefer $900 certain to 90% × $1,000 |
| High ($p > 0.35$) | Loss | $\pi(p) < p$ (underweighted) | Risk Seeking | Prefer 90% chance of −$1,000 to −$900 certain |
| Low ($p < 0.35$) | Gain | $\pi(p) > p$ (overweighted) | Risk Seeking | Buy lottery tickets |
| Low ($p < 0.35$) | Loss | $\pi(p) > p$ (overweighted) | Risk Averse | Buy insurance |

---

## 8. Cumulative Prospect Theory

### 8.1 Why the 1979 Version Needed Updating

The original 1979 version of Prospect Theory, while enormously successful at organising empirical findings, had a technical problem: it violated **first-order stochastic dominance**. A lottery that offers weakly better outcomes in every scenario should always be preferred by any sensible decision-maker (this is the weakest possible rationality requirement). The original Prospect Theory, with its separate probability weighting for each outcome, could produce violations of this property.

Tversky and Kahneman (1992) resolved this problem in their **Cumulative Prospect Theory (CPT)** paper, which refined the probability weighting to use **rank-dependent** weights applied to cumulative probabilities rather than to individual outcome probabilities.

### 8.2 The CPT Value Formula

The CPT value of a prospect is:

$$V(\text{prospect}) = \sum_{i} \pi_i \cdot v(x_i - r)$$

where:
- $r$ is the reference point
- $x_i - r$ is the gain or loss of outcome $i$ relative to $r$
- $v(\cdot)$ is the S-shaped value function with $\alpha = \beta = 0.88$ and $\lambda = 2.25$
- $\pi_i$ are rank-dependent cumulative decision weights derived from the probability weighting function with $\gamma = 0.65$

The key innovation of CPT is how the $\pi_i$ are computed. Rather than applying $\pi(\cdot)$ separately to each probability, outcomes are ranked from worst to best (separately for gains and losses), and the weight of each outcome is the weight on the cumulative probability of receiving at least that outcome minus the weight on the cumulative probability of receiving a strictly better outcome. This rank-dependent weighting preserves first-order stochastic dominance while retaining all the empirical strengths of the original theory.

**Empirical fit.** Camerer (1995) demonstrated that CPT correctly predicted over 90% of modal choices in problems where EUT predicted incorrectly. Wu and Gonzalez (1996) found the CPT value function fitted data well across cultural settings. The model has been estimated on datasets ranging from laboratory experiments with small stakes to field data on insurance demand and financial asset pricing, consistently outperforming the EUT alternative.

### 8.3 CPT versus EUT: A Direct Comparison

**Table 3.3: Expected Utility Theory vs Prospect Theory**

| Feature | Expected Utility Theory | Cumulative Prospect Theory |
|---|---|---|
| **What enters the function** | Final wealth $w$ | Changes from reference point $x = w - r$ |
| **Reference point** | None | Central to the model |
| **Curvature** | Concave everywhere (risk aversion) | Concave in gains; convex in losses |
| **Gain/loss asymmetry** | None | $\lambda \approx 2.25$ (loss aversion) |
| **Probability treatment** | Linear ($p$ enters directly) | Nonlinear (inverse-S weighting function) |
| **Predicted risk attitude** | Always risk averse | Four-fold pattern |
| **Framing effects** | None predicted | Directly predicted |
| **Endowment effect** | None predicted | Directly predicted |
| **Disposition effect** | None predicted | Directly predicted |

---

## 9. Applications

### 9.1 Insurance and Lottery Demand

The combination of the value function and the probability weighting function jointly explain two puzzling features of markets that standard theory handles poorly.

**Why people simultaneously buy insurance and lottery tickets.** Under EUT with a concave utility function, a risk-averse person should not buy lottery tickets (they have negative expected value). A risk-seeking person might buy them but should not buy insurance. The standard model cannot accommodate both behaviours in the same person. Prospect Theory can: the same person exhibits risk aversion over probable losses (buys insurance because a small probability of loss is overweighted, and losing feels worse than equivalent gaining feels good) and risk seeking over improbable gains (buys lottery tickets because a small probability of gain is overweighted). The model treats both as arising from the same psychological mechanisms — probability overweighting and the asymmetric value function — operating in different domains.

**Extended warranties.** Consumer demand for extended warranties on electronics and appliances is difficult to explain under standard EUT: the warranty has a negative expected value (the retailer makes money by selling them), and the risk involved is small relative to total wealth, so even a risk-averse consumer should decline. Prospect Theory explains it through the possibility effect: the small probability of a costly repair is overweighted, making the insurance feel more valuable than its expected value justifies.

### 9.2 Health Behaviour: Framing Effects in Medicine

Loss-framed and gain-framed health messages produce systematically different effects on behaviour. The principle, developed by Rothman and Salovey (1997), is that the appropriate frame depends on the type of health action:

**Detection behaviours** — medical tests such as mammograms, colonoscopies, and skin cancer checks — involve actions that are uncertain in their outcome. People are uncertain about what the test will reveal. In this context, a **gain frame** works better: emphasising what early detection allows ("Early detection saves lives"; "Finding it early means more treatment options") is more motivating than loss framing, perhaps because the uncertainty of what the test might find is itself aversive, and gain framing reduces the salience of that uncertainty.

**Prevention behaviours** — sunscreen use, vaccination, exercise, smoking cessation — involve certain costs (the inconvenience of the action) for uncertain future benefits. In this context, a **loss frame** works better: emphasising what failure to act costs ("Not getting vaccinated puts you and your family at risk"; "Failing to use sunscreen means risking cancer") is more motivating than emphasising the benefits of action. Loss framing activates the loss aversion response, making the cost of inaction feel more painful.

**Organ donation in Canada.** Canadian organ donation statistics illustrate the stakes: approximately 80% of Canadians report supporting organ donation in principle, yet in 2021 only about 23% had formally registered as donors. The gap between stated preference and registered behaviour is a classic present-bias problem (Chapter 4), but the framing of registration decisions also matters. Research suggests that loss-framed messaging — "Every year, 1,600 Canadians die waiting for an organ you could provide" — is more effective at prompting registration than gain-framed messaging — "By registering, you could save a life."

Nova Scotia became the first Canadian province to adopt **opt-out organ donation legislation**, effective January 2021. Under this system, all adult residents are presumed to consent to organ donation unless they have explicitly opted out. The shift from opt-in (requiring action to donate) to opt-out (requiring action to not donate) exploits both inertia (default bias, Chapter 9) and the loss frame: opting out is now a choice to *not* donate, which is more easily framed as forgoing an opportunity to save lives.

### 9.3 The Equity Premium Puzzle

The **equity premium puzzle**, posed by Mehra and Prescott (1985), asks: why have US stocks returned approximately 6% more per year than US Treasury bonds over the past 130 years? This excess return — the **equity premium** — is extraordinarily large. Under standard EUT, it can only be rationalised by a coefficient of relative risk aversion in excess of 30 — implausibly large, inconsistent with other behavioural evidence, and incapable of explaining other features of asset markets.

Benartzi and Thaler (1995) proposed that the equity premium can be explained by the combination of two features of real investor behaviour: **loss aversion** and **myopic evaluation**.

**Myopic loss aversion** refers to the tendency of investors to evaluate their portfolio's performance over short intervals (such as annually) rather than over their full investment horizon. This matters because of a mathematical property of stock returns: in the short run, stocks are volatile and frequently register losses. Over longer horizons, the probability of a loss from a diversified stock portfolio falls substantially. An investor who checks their portfolio annually experiences frequent "loss" periods; an investor who checks every decade rarely does.

When investors evaluate their portfolios annually and are loss averse ($\lambda = 2.25$), the painful experience of frequent small losses from stocks — evaluated with $\lambda$-weighted regret — requires a substantial equity premium to make stock holding rational. Benartzi and Thaler showed that the required premium to compensate an annual-evaluation, loss-averse investor is exactly approximately 6% — matching the historical data.

**The policy implication** is direct: reducing the frequency with which investors see their portfolio values should increase their tolerance for volatility and their willingness to hold equities. Gneezy and Potters (1997) confirmed this experimentally: investors who received performance feedback less frequently took more risk and earned higher returns. This suggests that less frequent portfolio statements — or defaults that smooth the display of short-term volatility — could increase stock market participation and improve long-run household wealth accumulation.

### 9.4 Mental Accounting

A further application of reference dependence and loss aversion is **mental accounting**: the tendency to treat money differently depending on its source, intended purpose, or the "account" in which it is mentally categorised (Thaler, 1985).

Mental accounting generates several puzzling patterns:

**The house money effect.** Gamblers who have just won a large sum treat those winnings as "house money" — a different account from their regular savings — and take more risks with them than with an equivalent amount from their regular wealth. The winnings are coded as a gain and evaluated in the gain domain of the value function, generating risk-seeking behaviour.

**The sunk cost fallacy.** People continue investing in a project because they have already invested resources — time, money, effort — even when the past investment is irretrievable. Under standard EUT, sunk costs are irrelevant: only future costs and benefits should influence decisions. Under mental accounting, the sunk cost has created a reference point, and failing to complete the project represents a loss in the mental account associated with that project.

**Windfalls and fungibility.** A tax refund of $1,000 tends to be spent differently from a $1,000 increase in regular salary, even though both represent the same increase in annual income. Tax refunds are often treated as windfall income — categorised in a "fun money" mental account — and spent on discretionary items rather than saved or used for debt repayment. Permanent income is treated more conservatively, consistent with the mental account for regular finances. This behaviour violates the EUT principle that money is fungible: $1,000 is $1,000 regardless of its source.

---

## 10. Limitations and Ongoing Debates

Prospect Theory is not the final word. It is considerably more successful than EUT as a descriptive model of human choice, but it has limitations that are worth understanding.

**What determines the reference point?** Prospect Theory assumes the reference point is given — typically the status quo or an expectation — but does not provide a complete theory of how reference points form. This is an active area of research. Köszegi and Rabin (2006) proposed that reference points are determined by expectations: what you expected to receive becomes your reference point. This "expectation-based reference dependence" makes the theory more predictive by endogenising the reference point, at the cost of greater complexity.

**Dynamic choices.** In dynamic settings — where decisions unfold over time and reference points can shift — Prospect Theory's predictions become more complex. After a gain, the reference point might shift upward; after a loss, downward. The theory provides limited guidance on how quickly or completely reference points adjust.

**The domain of gains and losses.** The theory assumes people evaluate outcomes as gains or losses, but the boundary between these domains depends on the reference point, which is itself uncertain and context-dependent. Small changes in how a problem is framed can shift outcomes between the gain and loss domains, generating potentially large changes in predicted behaviour.

**Evolutionary and cultural variation.** While loss aversion appears to be broadly universal (even appearing in capuchin monkeys), the magnitude of $\lambda$ varies across cultures and contexts. Societies and individuals differ in how strongly they respond to losses relative to gains, and these differences have important implications for policy design.

Despite these limitations, Prospect Theory represents the most successful model of human decision-making under uncertainty that economics has produced. It is the foundation for the applied work on consumer behaviour, financial markets, health policy, and regulatory design that occupies the later chapters of this textbook.

---

## Critical Thinking Questions

### Conceptual Questions

1. The value function is defined over gains and losses relative to a reference point, not over final wealth. What are the implications of this for the standard economic welfare analysis? If two policies produce the same final distribution of income but differ in how much "losing" and "gaining" occurs, does Prospect Theory imply they have different welfare effects?

2. Loss aversion has been explained both as an evolutionary adaptation and as a cognitive error. Are these explanations mutually exclusive? Can something be both adaptive in evolutionary terms and welfare-reducing in modern economic contexts?

3. The endowment effect (WTA > WTP) is inconsistent with standard consumer theory but consistent with Prospect Theory. What institutional arrangements — markets, regulations, legal systems — might reduce the endowment effect's negative economic consequences?

4. The four-fold pattern implies that people are simultaneously risk-seeking (in the loss domain at high probabilities) and risk-averse (in the gain domain at high probabilities). Does this mean a person has inconsistent risk preferences, or does it mean the standard concept of "risk preference" is not the right framework for describing human behaviour?

5. The probability weighting function overweights small probabilities. Can you construct an argument that overweighting small probabilities is rational in an environment where catastrophic tail risks are genuinely underestimated in historical data? (Think about "black swan" events.)

6. The disposition effect causes investors to hold losers and sell winners. Under what conditions might this be a rational strategy? (Hint: think about transaction costs, tax loss harvesting, and mean reversion in stock prices.)

7. The Köszegi-Rabin model proposes that reference points are determined by expectations. How does this change the predictions of Prospect Theory in competitive markets where prices are known in advance? What does it predict about the effects of sales and temporary price reductions?

8. Mental accounting implies that money is not fungible — its treatment depends on where it came from and what account it belongs to. In what ways might mental accounting actually be beneficial, helping people stick to financial plans? Is it always harmful?

9. Prospect Theory predicts that people will be risk-averse over gains at high probabilities. Yet many people with considerable accumulated wealth continue investing in risky assets. Can Prospect Theory accommodate this behaviour, or does it require supplementation?

10. The equity premium puzzle is resolved by myopic loss aversion — investors who check their portfolio annually experience too many losses. If this solution is correct, what does it imply about whether individual investors should hold diversified stock portfolios, and what information environment would support optimal long-run investing?

### Application Questions

11. A telecommunications company offers you a new phone plan. Representative A emphasises: "You'll save $20 per month compared to your current plan." Representative B emphasises: "Staying with your current plan will cost you $20 per month more than necessary." Which representative is more likely to close the sale? Which heuristic explains this, and how would Prospect Theory model it?

12. A mutual fund manager reports the following annual returns over a 5-year period: +15%, −8%, +12%, +3%, −6%. Using the concept of myopic loss aversion, explain why annual reporting of these returns may cause investors to allocate less to equities than is optimal. What reporting format would reduce this effect?

13. A city is considering an urban renewal project. Option A is described as: "The project will improve housing quality for 4,000 residents." Option B is described as: "Without the project, 6,000 residents will continue to experience substandard housing." Using Prospect Theory, predict how residents and politicians will respond to each framing. Is this a framing effect in the Kahneman-Tversky sense?

14. A patient is told they have a 5% chance of developing a serious complication from surgery. Their doctor says: "We can reduce the risk to 1% with a preventive treatment, but the treatment has side effects." Using the probability weighting function, predict how the patient will evaluate the 4-percentage-point reduction in risk. Is a 4% reduction from 5% to 1% likely to feel equivalent to a 4% reduction from 30% to 26%?

15. A government is designing a retirement savings incentive. Option A: a $500 tax refund for anyone who contributes $5,000 to an RRSP (framed as a gain for contributing). Option B: a $500 tax penalty for anyone who does not contribute $5,000 to an RRSP (framed as a loss for not contributing). Assuming the same net financial effect, which option does Prospect Theory predict will generate higher contribution rates? Why?

16. A sports car manufacturer is deciding between two marketing strategies. Strategy A emphasises performance gains over the consumer's current car: "60% more horsepower than your current vehicle." Strategy B emphasises what the consumer is missing by not owning this car: "Without this car, you're leaving performance on the table every time you drive." Which strategy does Prospect Theory predict will be more effective for consumers currently owning a high-end car? For those with a basic model?

17. During the 2022–2023 Canadian housing market downturn, some sellers withdrew their listings rather than sell at a loss. What are the aggregate economic consequences of many sellers simultaneously refusing to sell below their purchase price? Draw on your knowledge of supply and demand as well as Prospect Theory.

18. A teacher is offered two compensation structures. Structure A: a base salary of $50,000. Structure B: a base salary of $55,000 with the possibility of a $5,000 "clawback" if student performance targets are not met. Using Prospect Theory and the evidence from the Fryer et al. (2012) teacher incentive study, predict which structure would produce better teaching outcomes and explain why.

19. In a study of professional golfers, Pope and Schweitzer (2011) found that golfers putt significantly better for par than for birdie. Explain this result using reference dependence. What is the reference point, and what does it imply about the psychological experience of a birdie putt versus a par putt?

20. A bank offers two credit card products. Card A has a "no annual fee" structure with a 22% interest rate. Card B has a $100 annual fee but a 14% interest rate. For a customer who typically carries a $1,500 balance, Card B saves $70 per year net. Using mental accounting and loss aversion, explain why most consumers choose Card A, and what the bank should do to increase Card B uptake.

### Discussion Questions

21. Prospect Theory was developed by psychologists studying laboratory choices involving hypothetical or small-stakes gambles. What evidence do we have that its findings generalise to high-stakes, real-world financial decisions? What evidence might we look for, and what would constitute a definitive test?

22. Loss aversion implies that the pain of a loss exceeds the pleasure of an equivalent gain. Does this mean that economic transactions that produce the same distribution of final wealth but involve more "losing" and "gaining" (like a volatile market versus a smooth one) are genuinely worse for welfare? What are the philosophical implications for welfare economics?

23. The disposition effect causes investors to hold losing stocks and sell winning ones — a strategy that on average underperforms the market. Yet the pattern persists across countries, time periods, and levels of investor sophistication. Why hasn't market competition eliminated the disposition effect? What would have to be true for market forces to eliminate it?

24. Insurance is explained by loss aversion and probability overweighting: people pay premiums exceeding actuarial fair value. Does this mean insurance markets exploit consumers? Or is the subjective value of protection — the peace of mind from certainty — a genuine good that justifies the premium?

25. The four-fold pattern predicts that people will be risk-seeking in the loss domain at high probabilities: they will gamble to avoid a certain loss. This implies that firms or governments facing certain large losses might take risky actions to avoid crystallising them. Can you think of historical examples where organisations' loss-averse behaviour led to catastrophic risk-taking to avoid accepting a certain loss?

26. Prospect Theory and EUT give identical predictions for some decisions and divergent predictions for others. When are the two models observationally equivalent? Under what conditions does it matter most which model is correct?

27. Some researchers have argued that loss aversion can be "unlearned" — that with sufficient experience and feedback in particular domains, the asymmetry between gains and losses diminishes. If this is true, what does it imply for the generality of Prospect Theory? And what does it imply for markets where participants are highly experienced?

28. Organ donation is used as an example of default effects (Chapter 9) and of loss framing. Nova Scotia's opt-out policy has increased registration rates. Is this an example of libertarian paternalism (people are still free to opt out) or does it cross into manipulation, because it exploits both inertia and loss framing? Where should the line be drawn?

29. CPT incorporates both a value function (capturing loss aversion and diminishing sensitivity) and a probability weighting function (capturing the overweighting of small probabilities and underweighting of large ones). Are these two components psychologically independent? Or might they share a common underlying cognitive mechanism?

30. Behavioural economists sometimes argue that loss aversion is "irrational" because it leads to decisions that fail to maximise final wealth. But loss aversion also motivates loss prevention, caution, and prudence. Is the goal of maximising final wealth the right standard for assessing rationality? What alternative standard might a critic of the standard view propose?

---

## Chapter Summary

This chapter presented Prospect Theory — the leading descriptive model of decision-making under uncertainty, and the primary formal output of the behavioural economics research programme.

**The four-fold pattern.** Expected Utility Theory predicts universal risk aversion (for any concave utility function). The empirical evidence reveals a systematic four-fold pattern: risk aversion for likely gains, risk seeking for likely losses, risk seeking for unlikely gains (lotteries), and risk aversion for unlikely losses (insurance). No single concave or convex utility function can reproduce this pattern; a new theory is required.

**Reference dependence.** The first pillar of Prospect Theory: outcomes are evaluated as gains or losses relative to a reference point, not as levels of final wealth. The reference point is typically the status quo but can be formed by expectations, social comparisons, or stated targets. Reference points determine the framing of outcomes (gain or loss) and therefore the entire structure of preferences over those outcomes. Nominal wage rigidity and framing effects in health behaviour are among the most economically significant consequences of reference dependence.

**Loss aversion.** The second pillar: losses loom larger than equivalent gains by a factor of approximately $\lambda = 2.25$. This asymmetry is documented in consumer markets, labour markets, financial markets, and — remarkably — in non-human primates. It generates the endowment effect (WTA > WTP), the disposition effect (holding losers and selling winners), resistance to nominal wage cuts, and the equity premium puzzle.

**The S-shaped value function.** The formal expression of reference dependence and loss aversion. The value function is concave in gains (diminishing sensitivity generating risk aversion), convex in losses (diminishing sensitivity generating risk seeking), and steeper in the loss domain than the gain domain (loss aversion). The parametric form with $\alpha = \beta = 0.88$ and $\lambda = 2.25$ fits the experimental data.

**The probability weighting function.** Probabilities are not weighted linearly. Small probabilities are overweighted (the possibility effect, generating lottery demand and insurance demand); large probabilities are underweighted (the certainty effect, generating preference for certainty). The inverse-S weighting function, with $\gamma \approx 0.65$, together with the value function, generates the complete four-fold pattern.

**Cumulative Prospect Theory (1992).** The refinement by Tversky and Kahneman (1992) that applied rank-dependent cumulative probability weights, fixing the first-order stochastic dominance violation in the original 1979 model while retaining all its empirical strengths.

**Applications.** Prospect Theory explains: the disposition effect in financial markets; housing market price stickiness; insurance and lottery demand; loss-framing effects in health promotion; wage rigidity; the equity premium puzzle (via myopic loss aversion); and mental accounting patterns including the house money effect and the sunk cost fallacy.

---

## Glossary

**Certainty Effect.** The tendency to disproportionately overweight outcomes that are certain relative to outcomes that are merely highly probable. The psychologically special status of certainty — as qualitatively different from "almost certain" — generates violations of the independence axiom of EUT.
*Example:* Preferring $2,400 for certain over a 99% chance of $2,500, even though the expected values are close. But preferring a 34% chance of $2,500 over a 33% chance of $2,400 — showing that a 1-percentage-point change matters much more near certainty than in the interior of the probability range.
*Why it matters:* The core mechanism behind the Allais paradox and a key driver of insurance demand.

**Cumulative Prospect Theory (CPT).** The 1992 refinement of Prospect Theory by Tversky and Kahneman that applies probability weighting to cumulative rather than individual outcome probabilities, preserving first-order stochastic dominance while retaining all the empirical advantages of the original model. The standard version of Prospect Theory used in current research.
*Formula:* $V = \sum_i \pi_i \cdot v(x_i - r)$ with rank-dependent cumulative weights $\pi_i$, $\alpha = \beta = 0.88$, $\lambda = 2.25$, $\gamma = 0.65$.
*Why it matters:* The primary formal model of decision under uncertainty in behavioural economics; outperforms EUT in describing observed choices across cultures, stakes, and contexts.

**Diminishing Sensitivity.** The property of the value function that each additional unit of gain (or loss) produces less additional value (or pain) than the previous unit. Generates concavity in gains and convexity in losses.
*Example:* Going from $0 to $100 in gains feels much better than going from $1,000 to $1,100; going from $0 to $100 in losses feels much worse than going from $1,000 to $1,100 in losses.
*Why it matters:* Jointly with loss aversion, produces the S-shape of the value function and drives the four-fold pattern of risk attitudes.

**Disposition Effect.** The tendency of investors to sell assets that have increased in value (relative to purchase price) and hold assets that have decreased in value. Predicted by Prospect Theory: the gain domain is concave (risk aversion → sell winners), the loss domain is convex (risk seeking → hold losers).
*Evidence:* Odean (1998): investors 52% more likely to sell winning positions than losing ones; costs approximately 3.4% in annual returns.
*Why it matters:* One of the most robust demonstrations of Prospect Theory in real financial market data; has been replicated in over a dozen countries.

**Endowment Effect.** The tendency for the minimum price at which a person is willing to sell an object they own (WTA) to exceed the maximum price at which they are willing to buy the same object (WTP). Caused by loss aversion: giving up an owned object is a loss, while acquiring it would be a gain, and losses loom larger.
*Evidence:* Kahneman, Knetsch, and Thaler (1990) mug experiment: median WTA = $7.12, median WTP = $2.87 for identical mugs.
*Why it matters:* Implies markets may fail to achieve efficient allocation of goods; has implications for policy reform, legal liability rules, and negotiation.

**Equity Premium Puzzle.** The empirical observation that US stocks have earned approximately 6% more per year than bonds over the past 130 years — a premium far larger than EUT can rationalise without implausible risk aversion. Explained by Benartzi and Thaler (1995) as the result of myopic loss aversion.
*Why it matters:* Demonstrates the macro-level implications of Prospect Theory parameters estimated from laboratory experiments; the most important application of PT to asset pricing.

**Four-Fold Pattern.** The systematic pattern of risk attitudes documented by Kahneman and Tversky: risk aversion for likely gains, risk seeking for likely losses, risk seeking for unlikely gains, and risk aversion for unlikely losses. Produced jointly by the S-shaped value function and the inverse-S probability weighting function.
*Why it matters:* The central empirical target that Prospect Theory was designed to explain; simultaneously accounts for insurance demand, lottery demand, and a range of other financial behaviours within a single framework.

**Loss Aversion.** The asymmetric response to gains and losses: losses loom larger than equivalent gains by a factor of approximately $\lambda \approx 2.25$. The central psychological feature of Prospect Theory, producing the steeper slope of the value function in the loss domain.
*Formula:* $\lambda = |v(-x)| / v(x) \approx 2.25$ for any $x > 0$.
*Why it matters:* Explains wage rigidity, the endowment effect, the disposition effect, the equity premium puzzle, excessive insurance demand, and the general tendency to avoid realising losses.

**Loss Aversion Coefficient ($\lambda$).** The numerical parameter measuring the ratio of the marginal disutility of losses to the marginal utility of equivalent gains in the Prospect Theory value function. Estimated at approximately $\lambda \approx 2.25$ by Tversky and Kahneman (1992) and confirmed across multiple independent datasets.

**Mental Accounting.** The tendency to categorise and evaluate money differently depending on its source, intended purpose, or the subjective "account" to which it is assigned. Generates violations of the EUT principle that money is fungible.
*Examples:* Treating a tax refund differently from regular income; the "house money" effect in gambling; the sunk cost fallacy; spending windfall gains more freely than equivalent regular earnings.
*Why it matters:* Explains a range of household financial behaviours that violate fungibility, with implications for tax policy, financial product design, and savings behaviour.

**Myopic Loss Aversion.** The combination of loss aversion and frequent portfolio evaluation. When loss-averse investors evaluate their portfolios over short intervals (e.g., annually), they experience frequent painful losses from volatile assets, requiring a large equity premium to hold stocks willingly. Proposed by Benartzi and Thaler (1995) as the explanation for the equity premium puzzle.
*Why it matters:* Predicts that less frequent portfolio reporting should increase stock market participation and willingness to hold equities — a testable and policy-relevant implication.

**Possibility Effect.** The disproportionate weight assigned to outcomes with small but positive probability, relative to outcomes with probability zero. Makes the difference between "impossible" and "very unlikely" feel larger than the difference between "50% likely" and "51% likely."
*Example:* People buy lottery tickets with very small winning probabilities because those small probabilities are overweighted by the probability weighting function.
*Why it matters:* Together with the certainty effect, explains the full shape of the probability weighting function and supports the four-fold pattern.

**Probability Weighting Function ($\pi(p)$).** The function in Prospect Theory that maps objective probabilities $p$ into subjective decision weights $\pi(p)$. Has an inverse-S shape: overweights small probabilities ($\pi(p) > p$ for small $p$) and underweights large probabilities ($\pi(p) < p$ for large $p$). Estimated with parameter $\gamma \approx 0.65$ using the Prelec (1998) functional form.
*Why it matters:* Together with the value function, generates the complete four-fold pattern of risk attitudes; explains the demand for both insurance and lotteries.

**Reference Dependence.** The Prospect Theory principle that outcomes are evaluated as gains or losses relative to a reference point, not as levels of final wealth. The same final wealth level can be experienced as a gain or a loss depending on the reference point.
*Example:* A $500 raise feels like a gain if you expected $300 and a loss if you expected $800.
*Why it matters:* The most fundamental departure of Prospect Theory from EUT; implies that framing, presentation, and the context in which choices are made matter for economic decisions.

**S-shaped Value Function.** The Prospect Theory value function, which combines concavity in the gain domain (risk aversion over likely gains) with convexity in the loss domain (risk seeking over likely losses) and a steeper slope in the loss domain (loss aversion). Named for its characteristic S-shape when plotted.
*Parametric form:* $v(x) = x^\alpha$ for gains; $v(x) = -\lambda(-x)^\beta$ for losses; with $\alpha = \beta = 0.88$, $\lambda = 2.25$.
*Why it matters:* The central formal element of Prospect Theory; the foundation for predicting risk attitudes, framing effects, the endowment effect, and the disposition effect.

**Willingness to Accept (WTA).** The minimum price at which an individual is willing to sell an object they own. Under EUT, WTA = WTP for goods with no special affective value. Under Prospect Theory, WTA > WTP due to loss aversion (giving up the object is a loss; acquiring it would have been a gain).

**Willingness to Pay (WTP).** The maximum price an individual is willing to pay to acquire an object. The systematic gap WTA > WTP — the endowment effect — is one of the most replicated findings in experimental economics.

---

## References

Akerlof, G. A., Dickens, W. T., & Perry, G. L. (1996). The macroeconomics of low inflation. *Brookings Papers on Economic Activity*, 1, 1–76.

Benartzi, S., & Thaler, R. H. (1995). Myopic loss aversion and the equity premium puzzle. *Quarterly Journal of Economics*, 110(1), 73–92.

Camerer, C. F. (1995). Individual decision making. In J. H. Kagel & A. E. Roth (Eds.), *Handbook of Experimental Economics* (pp. 587–703). Princeton University Press.

Chen, M. K., Lakshminarayanan, V., & Santos, L. R. (2009). How basic are behavioral biases? Evidence from capuchin monkey trading behavior. *Journal of Political Economy*, 114(3), 517–537.

Choe, H., & Eom, Y. (2009). The disposition effect and investment performance in the futures market. *Journal of Futures Markets*, 29(6), 496–522.

Davis, S. J., & Wachter, T. von. (2011). Recessions and the costs of job loss. *Brookings Papers on Economic Activity*, 2, 1–72.

Fryer, R. G., Levitt, S. D., List, J. A., & Sadoff, S. (2012). Enhancing the efficacy of teacher incentives through loss aversion: A field experiment. *NBER Working Paper No. 18237*.

Genesove, D., & Mayer, C. (2001). Loss aversion and seller behavior: Evidence from the housing market. *Quarterly Journal of Economics*, 116(4), 1233–1260.

Gneezy, U., & Potters, J. (1997). An experiment on risk taking and evaluation periods. *Quarterly Journal of Economics*, 112(2), 631–645.

Grinblatt, M., & Keloharju, M. (2001). What makes investors trade? *Journal of Finance*, 56(2), 589–616.

Hardie, B. G. S., Johnson, E. J., & Fader, P. S. (1993). Modeling loss aversion and reference dependence effects on brand choice. *Marketing Science*, 12(4), 378–394.

Kahneman, D., Knetsch, J. L., & Thaler, R. H. (1990). Experimental tests of the endowment effect and the Coase theorem. *Journal of Political Economy*, 98(6), 1325–1348.

Kahneman, D., & Tversky, A. (1979). Prospect theory: An analysis of decision under risk. *Econometrica*, 47(2), 263–291.

Kahneman, D., & Tversky, A. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.

Köszegi, B., & Rabin, M. (2006). A model of reference-dependent preferences. *Quarterly Journal of Economics*, 121(4), 1133–1165.

Mehra, R., & Prescott, E. C. (1985). The equity premium: A puzzle. *Journal of Monetary Economics*, 15(2), 145–161.

Odean, T. (1998). Are investors reluctant to realize their losses? *Journal of Finance*, 53(5), 1775–1798.

Pope, D. G., & Schweitzer, M. E. (2011). Is Tiger Woods loss averse? Persistent bias in the face of experience, competition, and high stakes. *American Economic Review*, 101(1), 129–157.

Prelec, D. (1998). The probability weighting function. *Econometrica*, 66(3), 497–527.

Rabin, M. (2000). Risk aversion and expected-utility theory: A calibration theorem. *Econometrica*, 68(5), 1281–1292.

Rothman, A. J., & Salovey, P. (1997). Shaping perceptions to motivate healthy behavior: The role of message framing. *Psychological Bulletin*, 121(1), 3–19.

Shafir, E., Diamond, P., & Tversky, A. (1997). Money illusion. *Quarterly Journal of Economics*, 112(2), 341–374.

Shapira, Z., & Venezia, I. (2001). Patterns of behavior of professionally managed and independent investors. *Journal of Banking and Finance*, 25(8), 1573–1587.

Shefrin, H., & Statman, M. (1985). The disposition to sell winners too early and ride losers too long: Theory and evidence. *Journal of Finance*, 40(3), 777–790.

Thaler, R. H. (1985). Mental accounting and consumer choice. *Marketing Science*, 4(3), 199–214.

Tversky, A., & Kahneman, D. (1992). Advances in prospect theory: Cumulative representation of uncertainty. *Journal of Risk and Uncertainty*, 5(4), 297–323.

Wu, G., & Gonzalez, R. (1996). Curvature of the probability weighting function. *Management Science*, 42(12), 1676–1690.

---

*End of Chapter 3*

---

> **Looking Ahead.** Chapter 4 shifts from decisions under risk to decisions across time. We have seen that loss aversion produces irrational behaviour in the domain of uncertainty — people overreact to losses relative to gains, distorting their financial decisions. Chapter 4 examines an analogous distortion in the time domain: **present bias**, the tendency to weight immediate payoffs disproportionately relative to future ones. This produces **time inconsistency** — plans that are made but not kept — and underlies some of the most economically consequential failures of self-control that people experience: undersaving, overconsuming, procrastinating, and failing to follow through on commitments made to themselves.
