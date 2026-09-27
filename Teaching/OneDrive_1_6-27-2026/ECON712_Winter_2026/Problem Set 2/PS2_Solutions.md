# ECON712 — Problem Set 2 Solutions
**Leandro Freylejer | Due: March 31, 2026**

---

## Question I: Potential Outcomes and Instrumental Variables

### Data (Table 1)

| Parents' Education        | Public Score (n) | Private Score (n) |
|---------------------------|-----------------|-------------------|
| Post-Graduate Degree      | 78.5 (80)       | 88.9 (140)        |
| Undergraduate Degree      | 77.0 (32)       | 86.5 (56)         |
| Finish High-School        | 66.7 (60)       | 76.5 (50)         |
| Did Not Finish High-School| 64.0 (30)       | 70.8 (25)         |

Total: $n_0 = 202$ (public), $n_1 = 271$ (private), $N = 473$.

---

### Part (a): OLS Estimate of $\hat{\beta}_1$

Since $D_i$ is binary and the regression includes only a constant and $D_i$, the OLS estimator satisfies:

$$\hat{\beta}_1 = \bar{y}_{private} - \bar{y}_{public}$$

**Computing $\bar{y}_{public}$:**

$$\bar{y}_{public} = \frac{78.5(80) + 77(32) + 66.7(60) + 64(30)}{202} = \frac{6280 + 2464 + 4002 + 1920}{202} = \frac{14{,}666}{202} \approx 72.60$$

**Computing $\bar{y}_{private}$:**

$$\bar{y}_{private} = \frac{88.9(140) + 86.5(56) + 76.5(50) + 70.8(25)}{271} = \frac{12{,}446 + 4{,}844 + 3{,}825 + 1{,}770}{271} = \frac{22{,}885}{271} \approx 84.45$$

$$\boxed{\hat{\beta}_1 = 84.45 - 72.60 \approx 11.84}$$

**Is $\hat{\beta}_1$ consistent for the ATE?**

No. $\hat{\beta}_1$ is not a consistent estimator of the ATE due to two sources of bias:

**1. Selection Bias.** Students self-select into school type based on unobservable characteristics (family wealth, parental involvement) that also affect test scores. Families choosing private school are not a random draw from the population — those with post-graduate parents are overrepresented among private school attendees. This creates a systematic difference in the counterfactual baseline $\mathbb{E}[y_i(0)|D_i=1] \neq \mathbb{E}[y_i(0)|D_i=0]$: private school students would have scored higher even had they attended public school. In this example, the high share of post-graduate families in private school ($140/271 \approx 52\%$) versus public school ($80/202 \approx 40\%$) inflates $\bar{y}_{private}$ upward.

**2. Heterogeneous Treatment Effect Bias.** Even absent selection bias, the naïve difference-in-means recovers the ATT (treatment effect weighted by the treated distribution), not the ATE (population-weighted average). If treatment effects differ across parental education groups — and the data show they do (gaps range from 6.8 to 10.4 points) — and if the distribution of $x$ in the treated group differs from the population distribution, then $\hat{\beta}_1 \neq ATE$. Private schools enroll relatively more high-education-background students, who also exhibit larger gains, further inflating the estimate.

---

### Part (b): ATE and ATT under CIA

Under the CIA — $(y_i(0), y_i(1)) \perp D_i \mid x_i$ — we can use within-stratum comparisons as unbiased estimates of the conditional average treatment effect $\tau(x) = \mathbb{E}[y(1) - y(0) \mid x]$.

**Within-stratum treatment effects $\tau(x)$:**

| Stratum $x$               | $\mathbb{E}[y\mid D=1, x]$ | $\mathbb{E}[y\mid D=0, x]$ | $\tau(x)$ | $n(x)$ | $n_1(x)$ |
|---------------------------|---------------------------|---------------------------|-----------|--------|----------|
| Post-Graduate             | 88.9                      | 78.5                      | **10.4**  | 220    | 140      |
| Undergraduate             | 86.5                      | 77.0                      | **9.5**   | 88     | 56       |
| Finish High-School        | 76.5                      | 66.7                      | **9.8**   | 110    | 50       |
| Did Not Finish High-School| 70.8                      | 64.0                      | **6.8**   | 55     | 25       |

**ATE** (weighted by population shares $P(x) = n(x)/N$):

$$ATE = \sum_x \tau(x) \cdot \frac{n(x)}{N} = \frac{10.4(220) + 9.5(88) + 9.8(110) + 6.8(55)}{473}$$

$$= \frac{2288 + 836 + 1078 + 374}{473} = \frac{4576}{473} \approx \boxed{9.67}$$

**ATT** (weighted by the distribution among the treated, $P(x\mid D=1) = n_1(x)/n_1$):

$$ATT = \sum_x \tau(x) \cdot \frac{n_1(x)}{n_1} = \frac{10.4(140) + 9.5(56) + 9.8(50) + 6.8(25)}{271}$$

$$= \frac{1456 + 532 + 490 + 170}{271} = \frac{2648}{271} \approx \boxed{9.77}$$

The ATT ($9.77$) slightly exceeds the ATE ($9.67$) because private school students are disproportionately drawn from the post-graduate stratum, where the treatment effect is largest ($10.4$).

---

### Part (c): ATE with Counterfactual Data — Decomposing the Bias in $\hat{\beta}_1$

**Interpreting Table 2.** Table 2 reports counterfactual scores for each group: the "Public School (CF)" column gives the average score that the *private school* students in that stratum would have received had they attended public school; the "Private School (CF)" column gives the score that the *public school* students would have received had they attended private school.

| Stratum                   | $\mathbb{E}[y(0)\mid D=1, x]$ (CF public) | $n_1(x)$ | $\mathbb{E}[y(1)\mid D=0, x]$ (CF private) | $n_0(x)$ |
|---------------------------|--------------------------------------------|----------|---------------------------------------------|----------|
| Post-Graduate             | 80.25                                      | 140      | 85.4                                        | 80       |
| Undergraduate             | 79.5                                       | 56       | 81.7                                        | 32       |
| Finish High-School        | 70.0                                       | 50       | 74.7                                        | 60       |
| Did Not Finish High-School| 69.8                                       | 25       | 69.0                                        | 30       |

**Computing ATT and ATU from counterfactual data.**

The **ATT** is the average treatment effect for those who actually attended private school — what they gained relative to what they would have scored in public school:

$$ATT = \mathbb{E}[y(1)-y(0)\mid D=1] = \bar{y}_{D=1} - \mathbb{E}[y(0)\mid D=1]$$

$\mathbb{E}[y(0)\mid D=1]$ is the average counterfactual public-school score for private school students (from the CF Public column of Table 2, weighted by private school enrollment):

$$\mathbb{E}[y(0)\mid D=1] = \frac{80.25(140) + 79.5(56) + 70.0(50) + 69.8(25)}{271} = \frac{20{,}932}{271} \approx 77.24$$

$$ATT = 84.45 - 77.24 = 7.21$$

The **ATU** (average treatment effect on the untreated) is what public school students would have gained from attending private school:

$$ATU = \mathbb{E}[y(1)-y(0)\mid D=0] = \mathbb{E}[y(1)\mid D=0] - \bar{y}_{D=0}$$

$\mathbb{E}[y(1)\mid D=0]$ is the average counterfactual private-school score for public school students (from the CF Private column of Table 2):

$$\mathbb{E}[y(1)\mid D=0] = \frac{85.4(80) + 81.7(32) + 74.7(60) + 69.0(30)}{202} = \frac{15{,}998.4}{202} \approx 79.20$$

$$ATU = 79.20 - 72.60 = 6.60$$

**ATE via the Law of Iterated Expectations.**

By the LIE, the ATE can be written as a weighted average of the ATT and ATU, with weights equal to the shares of treated and untreated in the population ($\Pi = n_1/N = 271/473$):

$$ATE = \Pi \cdot \mathbb{E}[y(1)-y(0)\mid D=1] + (1-\Pi) \cdot \mathbb{E}[y(1)-y(0)\mid D=0]$$

$$= \frac{271}{473} \times 7.21 + \frac{202}{473} \times 6.60 = 0.573 \times 7.21 + 0.427 \times 6.60$$

$$= 4.13 + 2.82 = \boxed{6.95}$$

**Decomposing $\hat{\beta}_1 = 11.84$ into bias components:**

The standard decomposition of the naïve estimator is:

$$\underbrace{\bar{y}_{D=1} - \bar{y}_{D=0}}_{\hat{\beta}_1} = \underbrace{ATE}_{\text{causal}} + \underbrace{\mathbb{E}[y(0)\mid D=1] - \mathbb{E}[y(0)\mid D=0]}_{\text{Selection Bias}} + \underbrace{(ATT - ATE) \cdot P(D=0)}_{\text{Heterogeneous TE Bias}}$$

**Selection Bias:** Private school students have higher baseline ability — they would score higher even in public school. Formally:

$$\mathbb{E}[y(0)\mid D=0] = \bar{y}_{public} \approx 72.60$$

$$\boxed{\text{Selection Bias} = \mathbb{E}[y(0)\mid D=1] - \mathbb{E}[y(0)\mid D=0] = 77.24 - 72.60 = 4.64}$$

Private school students would have scored 4.64 points higher even in public school — they come from systematically advantaged backgrounds.

**Heterogeneous Treatment Effect Bias:** Since $ATE = \Pi \cdot ATT + (1-\Pi) \cdot ATU$, we can write $ATT - ATE = (1-\Pi)(ATT - ATU)$. With $ATT = 7.21$, $ATU = 6.60$, and $1-\Pi = 202/473$:

$$\boxed{\text{HTE Bias} = (ATT - ATU) \cdot P(D=0) = (7.21 - 6.60) \times \frac{202}{473} = 0.61 \times 0.427 = 0.26}$$

This arises because $ATT > ATU$: private school students (who tend to come from higher-education families) benefit more from private schooling than public school students would.

**Verification:**

$$\hat{\beta}_1 = ATE + \text{Selection Bias} + \text{HTE Bias} = 6.95 + 4.64 + 0.26 = 11.85 \approx 11.84 \checkmark$$

The dominant source of bias is selection ($4.64$ out of $4.89$ total bias). Heterogeneous treatment effect bias is small ($0.26$) because the distribution of parental education among private school students is only modestly different from the population distribution.

---

### Part (d): Using a Lottery as an Instrument

**Setup.** A government lottery randomly assigns winners ($Z_i = 1$) the ability to attend private school for free, while non-winners ($Z_i = 0$) face the original tuition costs. We observe only $y_i$ (test score), $D_i$ (school type), and $Z_i$ (lottery outcome).

**Using $Z_i$ as an IV for $D_i$:**

Define potential treatment takeup: $D_i(z)$ = school attended if lottery outcome is $z$. The lottery generates four latent types:
- **Always-takers:** $D_i(1) = D_i(0) = 1$ (attend private regardless — already wealthy)
- **Never-takers:** $D_i(1) = D_i(0) = 0$ (don't attend private regardless)
- **Compliers:** $D_i(0) = 0$, $D_i(1) = 1$ (switch to private only if they win — the target group)
- **Defiers:** $D_i(0) = 1$, $D_i(1) = 0$ (ruled out by monotonicity)

**Required assumptions:**

1. **Relevance:** $\mathbb{E}[D_i \mid Z_i=1] \neq \mathbb{E}[D_i \mid Z_i=0]$. The lottery must actually induce some students to switch schools. Plausible: free tuition removes the key barrier.

2. **Independence (Instrument Exogeneity):** $Z_i \perp (y_i(0), y_i(1), D_i(0), D_i(1))$. Since the lottery is randomized across the population, lottery status is orthogonal to all potential outcomes and potential school choices. This is the key advantage of the lottery over observational variation.

3. **Exclusion Restriction:** $Z_i$ affects $y_i$ *only through* $D_i$. The lottery result itself has no direct effect on test scores — it only affects the school attended. This would fail if, e.g., knowing you won the lottery boosted motivation regardless of school enrollment.

4. **Monotonicity:** $D_i(1) \geq D_i(0)$ for all $i$. Winning the lottery weakly increases private school attendance — no one is made less likely to attend private school by winning free tuition.

**Estimator.** Under these assumptions, the IV (Wald) estimator is:

$$\hat{\beta}^{IV} = \frac{\bar{y}_{Z=1} - \bar{y}_{Z=0}}{\bar{D}_{Z=1} - \bar{D}_{Z=0}} = \frac{\text{Reduced Form}}{\text{First Stage}}$$

This can be implemented as 2SLS: regress $D_i$ on $Z_i$ (first stage) and then regress $y_i$ on $\hat{D}_i$ (second stage).

**Interpretation under treatment effect heterogeneity.** Under heterogeneous treatment effects, the IV estimator does **not** recover the ATE or ATT estimated in parts (b)–(c), but instead recovers the **Local Average Treatment Effect (LATE)**:

$$LATE = \mathbb{E}[y_i(1) - y_i(0) \mid \text{compliers}]$$

Compliers are families who would choose private school only if they win the lottery (i.e., those for whom tuition cost is the binding constraint). These are likely lower-to-middle income families with moderate parental education — not the wealthy post-graduate families already attending private school (always-takers). If private school returns are lower for this group (as the data in Table 1 suggest — the "Did Not Finish High School" gap is only $6.8$), then the LATE will be below both the ATE ($9.67$) and the ATT ($9.77$). The IV estimate applies specifically to this margin of switchers and should not be extrapolated to the full population or to the always-takers.

---

## Question II: Asymptotic Theory of OLS

Consider $y_i = \mathbf{X}_i^\top \boldsymbol{\beta} + u_i$ with i.i.d. observations.

### Part (a): Consistency of OLS

**Condition for consistency:** $\mathbb{E}[\mathbf{X}_i u_i] = \mathbf{0}$ (predeterminedness / mean independence $\mathbb{E}[u_i \mid \mathbf{X}_i] = 0$).

**Proof.** Write the OLS estimator as:

$$\hat{\boldsymbol{\beta}}^{OLS} = \boldsymbol{\beta} + \left(\frac{1}{n}\mathbf{X}^\top\mathbf{X}\right)^{-1}\left(\frac{1}{n}\mathbf{X}^\top\mathbf{u}\right)$$

By the **Law of Large Numbers** (applied to the i.i.d. sequence $\{\mathbf{X}_i\mathbf{X}_i^\top\}$):

$$\frac{1}{n}\mathbf{X}^\top\mathbf{X} = \frac{1}{n}\sum_{i=1}^n \mathbf{X}_i\mathbf{X}_i^\top \xrightarrow{p} \mathbb{E}[\mathbf{X}_i\mathbf{X}_i^\top] \equiv S_{X^\top X}$$

which is assumed positive definite (full rank). By the **Continuous Mapping Theorem (CMT)**, $\left(\frac{1}{n}\mathbf{X}^\top\mathbf{X}\right)^{-1} \xrightarrow{p} S_{X^\top X}^{-1}$.

By the **LLN** (applied to $\{\mathbf{X}_i u_i\}$, i.i.d. with $\mathbb{E}[\mathbf{X}_i u_i] = \mathbf{0}$):

$$\frac{1}{n}\mathbf{X}^\top\mathbf{u} = \frac{1}{n}\sum_{i=1}^n \mathbf{X}_i u_i \xrightarrow{p} \mathbb{E}[\mathbf{X}_i u_i] = \mathbf{0}$$

By **Slutsky's theorem** (product of a sequence converging in probability and a sequence converging in probability converges to the product of the limits):

$$\underset{n\to\infty}{\mathrm{plim}}\;\hat{\boldsymbol{\beta}}^{OLS} = \boldsymbol{\beta} + S_{X^\top X}^{-1} \cdot \mathbf{0} = \boldsymbol{\beta} \qquad \blacksquare$$

**Predeterminedness vs. Strict Exogeneity.** Strict exogeneity requires $\mathbb{E}[u_i \mid \mathbf{X}] = 0$ — i.e., the error of observation $i$ is mean-independent of the regressors of *all* observations. This ensures:

$$\mathbb{E}\left[\hat{\boldsymbol{\beta}}^{OLS} \mid \mathbf{X}\right] = \boldsymbol{\beta} + \left(\mathbf{X}^\top\mathbf{X}\right)^{-1}\mathbf{X}^\top \underbrace{\mathbb{E}[\mathbf{u}\mid\mathbf{X}]}_{=\mathbf{0}} = \boldsymbol{\beta}$$

so unbiasedness is an exact, finite-sample statement that requires conditioning on the *full* matrix $\mathbf{X}$.

Predeterminedness only requires $\mathbb{E}[u_i \mid \mathbf{X}_i] = 0$ — the error is mean-independent of *own* regressors. This is weaker: in dynamic panels with lagged dependent variables, $\mathbb{E}[u_t \mid x_t] = 0$ can hold while $\mathbb{E}[u_t \mid x_{t+1}] \neq 0$ (because $x_{t+1}$ depends on past $u_t$). Predeterminedness gives $\mathbb{E}[\mathbf{X}_i u_i] = \mathbf{0}$, which is sufficient for the LLN to deliver $\frac{1}{n}\mathbf{X}^\top\mathbf{u} \xrightarrow{p} \mathbf{0}$ and hence consistency, but it does not pin down $\mathbb{E}[\mathbf{u}\mid\mathbf{X}]$, so unbiasedness fails.

---

### Part (b): Asymptotic Distribution

**Starting point.** From the consistency proof:

$$\sqrt{n}\left(\hat{\boldsymbol{\beta}}^{OLS} - \boldsymbol{\beta}\right) = \left(\frac{1}{n}\sum_i \mathbf{X}_i\mathbf{X}_i^\top\right)^{-1} \cdot \frac{1}{\sqrt{n}}\sum_i \mathbf{X}_i u_i$$

**Step 1 — LLN for the first factor.** Since $\{\mathbf{X}_i\mathbf{X}_i^\top\}$ is i.i.d. with finite second moments, by the **LLN**:

$$\frac{1}{n}\sum_i \mathbf{X}_i\mathbf{X}_i^\top \xrightarrow{p} \mathbb{E}[\mathbf{X}_i\mathbf{X}_i^\top] = S_{X^\top X}$$

By the CMT, the inverse converges: $\left(\frac{1}{n}\sum_i \mathbf{X}_i\mathbf{X}_i^\top\right)^{-1} \xrightarrow{p} S_{X^\top X}^{-1}$.

**Step 2 — CLT for the second factor.** The random vectors $\{\mathbf{X}_i u_i\}$ are i.i.d. with:
- Mean: $\mathbb{E}[\mathbf{X}_i u_i] = \mathbf{0}$ (given)
- Variance: $\mathrm{Var}(\mathbf{X}_i u_i) = \mathbb{E}[u_i^2 \mathbf{X}_i\mathbf{X}_i^\top] = \Omega$ (finite by assumption)

By the **Lindeberg–Lévy CLT** (i.i.d., mean zero, finite variance):

$$\frac{1}{\sqrt{n}}\sum_i \mathbf{X}_i u_i \xrightarrow{d} N(\mathbf{0},\, \Omega)$$

**Step 3 — Slutsky's Theorem.** Combining a sequence converging in probability ($S_{X^\top X}^{-1}$) with a sequence converging in distribution ($\frac{1}{\sqrt{n}}\sum \mathbf{X}_i u_i$), **Slutsky's theorem** gives:

$$\sqrt{n}\left(\hat{\boldsymbol{\beta}}^{OLS} - \boldsymbol{\beta}\right) \xrightarrow{d} S_{X^\top X}^{-1} \cdot N(\mathbf{0},\Omega)$$

Since a linear transformation of a Gaussian is Gaussian:

$$\boxed{\sqrt{n}\left(\hat{\boldsymbol{\beta}}^{OLS} - \boldsymbol{\beta}\right) \xrightarrow{d} N\!\left(\mathbf{0},\; S_{X^\top X}^{-1}\,\Omega\, S_{X^\top X}^{-1}\right)} \qquad \blacksquare$$

---

### Part (c): Homoskedasticity and the Sandwich Estimator

**Simplification under homoskedasticity.** If $\mathbb{E}[u_i^2 \mid \mathbf{X}_i] = \sigma^2$, then by the **Law of Iterated Expectations**:

$$\Omega = \mathbb{E}[u_i^2\, \mathbf{X}_i\mathbf{X}_i^\top] = \mathbb{E}\!\left[\mathbb{E}[u_i^2 \mid \mathbf{X}_i]\, \mathbf{X}_i\mathbf{X}_i^\top\right] = \mathbb{E}\!\left[\sigma^2 \mathbf{X}_i\mathbf{X}_i^\top\right] = \sigma^2 S_{X^\top X}$$

Substituting into the sandwich:

$$S_{X^\top X}^{-1}\,\Omega\, S_{X^\top X}^{-1} = S_{X^\top X}^{-1}\,(\sigma^2 S_{X^\top X})\, S_{X^\top X}^{-1} = \sigma^2 S_{X^\top X}^{-1} \qquad \blacksquare$$

This is the classical asymptotic variance: the sandwich collapses when the bread and meat are proportional.

**Justification for heteroscedasticity-robust SE.** When $\mathbb{E}[u_i^2 \mid \mathbf{X}_i] \neq \sigma^2$ (heteroskedasticity), the classical formula $\sigma^2 S_{X^\top X}^{-1}$ is misspecified. The sandwich form $S_{X^\top X}^{-1}\,\Omega\, S_{X^\top X}^{-1}$ remains valid under the weaker assumption $\mathbb{E}[\mathbf{X}_i u_i] = \mathbf{0}$ alone, without any restriction on the conditional variance. We estimate $\Omega$ consistently with the HC estimator $\hat{\Omega} = \frac{1}{n}\sum_i \hat{u}_i^2\, \mathbf{X}_i\mathbf{X}_i^\top$, which converges to $\Omega$ by the LLN (the average of i.i.d. terms with mean $\Omega$).

**Why $\hat{\boldsymbol{\Sigma}}_u = \mathrm{diag}(\hat{u}_i^2)$ is not a consistent estimator of $\Omega$ directly.** $\hat{\boldsymbol{\Sigma}}_u$ is an $n \times n$ matrix with $n$ free parameters — one $\hat{u}_i^2$ per observation. Each diagonal entry $\hat{u}_i^2$ is an estimator of $\sigma_i^2 = \mathbb{E}[u_i^2 \mid \mathbf{X}_i]$ based on a *single* observation: there is no averaging, and $\hat{u}_i^2$ does not converge to $\sigma_i^2$ as $n \to \infty$. The dimension of the object being estimated grows with the sample size, so standard LLN arguments do not apply. In other words, you are trying to estimate $n$ individual variances with $n$ observations — the ratio of parameters to data never shrinks. This is an incidental parameters-type problem.

What *does* converge is the fixed-dimensional matrix $\Omega = \mathbb{E}[u_i^2 \mathbf{X}_i \mathbf{X}_i^\top]$, estimated by $\hat{\Omega} = \frac{1}{n}\mathbf{X}^\top \hat{\boldsymbol{\Sigma}}_u \mathbf{X} = \frac{1}{n}\sum_i \hat{u}_i^2 \mathbf{X}_i\mathbf{X}_i^\top$, which averages over many observations and is consistent by the LLN.

---

## Question III: The CEF and Linear Regression

### Part (a): CEF Decomposition and the OLS Population Coefficient

**CEF Decomposition Theorem.** For any random vector $(y_i, \mathbf{X}_i)$ with $\mathbb{E}[|y_i|] < \infty$, define $m(\mathbf{X}_i) \equiv \mathbb{E}[y_i \mid \mathbf{X}_i]$. Then:

$$y_i = \underbrace{m(\mathbf{X}_i)}_{\text{CEF}} + \underbrace{\varepsilon_i}_{\text{CEF residual}}$$

where $\varepsilon_i \equiv y_i - m(\mathbf{X}_i)$ satisfies:
1. $\mathbb{E}[\varepsilon_i \mid \mathbf{X}_i] = 0$ (by construction of the conditional expectation)
2. $\mathbb{E}[f(\mathbf{X}_i)\,\varepsilon_i] = 0$ for any measurable function $f$ (follows from property 1 by LIE)

**Implication for OLS when the CEF is linear.** Suppose $m(\mathbf{X}_i) = \mathbf{X}_i^\top\boldsymbol{\beta}^*$. The population OLS coefficient minimizes the expected squared error:

$$\boldsymbol{\beta}^{OLS} = \arg\min_{\boldsymbol{\beta}} \mathbb{E}\!\left[(y_i - \mathbf{X}_i^\top\boldsymbol{\beta})^2\right]$$

The first-order condition gives:

$$\mathbb{E}[\mathbf{X}_i(y_i - \mathbf{X}_i^\top\boldsymbol{\beta}^{OLS})] = \mathbf{0} \implies \boldsymbol{\beta}^{OLS} = \mathbb{E}[\mathbf{X}_i\mathbf{X}_i^\top]^{-1}\mathbb{E}[\mathbf{X}_i y_i]$$

Now substitute $y_i = \mathbf{X}_i^\top\boldsymbol{\beta}^* + \varepsilon_i$:

$$\mathbb{E}[\mathbf{X}_i y_i] = \mathbb{E}[\mathbf{X}_i\mathbf{X}_i^\top]\boldsymbol{\beta}^* + \mathbb{E}[\mathbf{X}_i\varepsilon_i]$$

By the CEF Decomposition, $\mathbb{E}[\mathbf{X}_i\varepsilon_i] = \mathbf{0}$. Therefore:

$$\boldsymbol{\beta}^{OLS} = \mathbb{E}[\mathbf{X}_i\mathbf{X}_i^\top]^{-1}\mathbb{E}[\mathbf{X}_i\mathbf{X}_i^\top]\boldsymbol{\beta}^* = \boldsymbol{\beta}^* \qquad \blacksquare$$

**Implication.** When the CEF is linear, OLS exactly recovers the CEF parameter. There is no approximation error: the OLS fit equals the conditional expectation function everywhere. This means OLS is not merely a useful approximation but the *correct* estimator of the conditional mean.

---

### Part (b): Implications When the CEF is Nonlinear

**OLS as the Best Linear Predictor.** When $m(\mathbf{X}_i)$ is nonlinear, the population OLS coefficient solves:

$$\boldsymbol{\beta}^{OLS} = \arg\min_{\boldsymbol{\beta}} \mathbb{E}\!\left[(m(\mathbf{X}_i) - \mathbf{X}_i^\top\boldsymbol{\beta})^2\right]$$

This is the Best Linear Predictor (BLP) of $y_i$ given $\mathbf{X}_i$. OLS consistently estimates $\boldsymbol{\beta}^{OLS}$, but $\mathbf{X}_i^\top\boldsymbol{\beta}^{OLS}$ is only a linear approximation to $m(\mathbf{X}_i)$, not equal to it.

The residual from OLS now includes two components:

$$y_i - \mathbf{X}_i^\top\hat{\boldsymbol{\beta}}^{OLS} = \underbrace{[m(\mathbf{X}_i) - \mathbf{X}_i^\top\boldsymbol{\beta}^{OLS}]}_{\text{approximation error}} + \varepsilon_i$$

The approximation error satisfies $\mathbb{E}[\mathbf{X}_i(m(\mathbf{X}_i) - \mathbf{X}_i^\top\boldsymbol{\beta}^{OLS})] = \mathbf{0}$ by the BLP optimality condition, but the full residual is *not* mean-independent of $\mathbf{X}_i$: $\mathbb{E}[u_i \mid \mathbf{X}_i] \neq 0$ in general when the CEF is nonlinear.

**Is OLS unbiased in finite samples?** No. Unbiasedness requires $\mathbb{E}[\hat{\boldsymbol{\beta}}^{OLS} \mid \mathbf{X}] = \boldsymbol{\beta}^{OLS}$, which in turn requires $\mathbb{E}[\mathbf{u} \mid \mathbf{X}] = \mathbf{0}$. If the CEF is nonlinear, $u_i = y_i - \mathbf{X}_i^\top\boldsymbol{\beta}^{OLS}$ contains the nonlinearity residual, so $\mathbb{E}[u_i \mid \mathbf{X}_i] = m(\mathbf{X}_i) - \mathbf{X}_i^\top\boldsymbol{\beta}^{OLS} \neq 0$ in general.

**Interpretation.** OLS estimates should be interpreted as the coefficients of the best linear approximation to the CEF, not as the structural parameters of the conditional mean. This matters for policy: the OLS slope captures a weighted average of the derivative of $m(\mathbf{X}_i)$ across the data support. If the CEF is highly nonlinear (e.g., effects differ sharply by covariate value), the linear estimate may be a poor summary and can be misleading when extrapolated outside the support of the data.

---

## Question IV: Titanic Subclassification

*Based on Cunningham (2021), Causal Inference: The Mixtape, p. 183.*

### Part (a): Replication of the Subclassification Exercise

```stata
* =========================================================
* ECON712 Problem Set 2 — Question IV
* Titanic Subclassification Exercise
* Based on: Cunningham (2021), The Mixtape, Ch. 4
* =========================================================

cap log close
set more off
clear all
log using "$mydirec/PS2_Q4.log", replace

* ---------------------------------------------------------
* Load Data
* The Mixtape's Titanic dataset contains individual records
* from the RMS Titanic manifest with key variables:
*   survived  — 1 if passenger survived, 0 if died
*   sex       — string: "male" or "female"
*   pclass    — passenger class: 1 (first), 2 (second), 3 (third)
*   age       — continuous age in years
* ---------------------------------------------------------

use "https://github.com/scunning1975/mixtape/raw/master/titanic.dta", clear

* Inspect the data
describe
summarize
tab pclass sex, missing

* ---------------------------------------------------------
* Create binary indicators
* ---------------------------------------------------------

* Binary treatment: female = 1 (female passenger), 0 (male)
* We study the effect of being female on survival probability
gen female = (sex == "female")
label variable female "1 = Female passenger"

* Binary indicator for first class (used in part d)
gen firstclass = (pclass == 1)
label variable firstclass "1 = First class passenger"

* ---------------------------------------------------------
* STEP 1: Naive (unconditional) difference in means
* This is the raw gap in survival rates between women and men,
* ignoring that class may confound the comparison (wealthier
* passengers are more likely to be female AND more likely to
* survive due to lifeboat access by class).
* ---------------------------------------------------------

* E[survived | female] - E[survived | male]
sum survived if female == 1
scalar mean_f = r(mean)
sum survived if female == 0
scalar mean_m = r(mean)

scalar naive_ATE = mean_f - mean_m
di "Naive (unconditional) ATE = " naive_ATE

* ---------------------------------------------------------
* STEP 2: Within-stratum survival rates
* Subclassification controls for passenger class by computing
* the gender survival gap separately within each class.
* Under CIA — (survived(0),survived(1)) ⊥ female | pclass —
* each within-class gap is a valid estimate of the
* conditional ATE for that stratum.
* ---------------------------------------------------------

* Tabulate mean survival by class and sex simultaneously
table pclass female, c(mean survived count survived)

* Store within-stratum survival rates (female and male)
forvalues k = 1/3 {
    sum survived if pclass == `k' & female == 1
    scalar mean_f`k' = r(mean)     // E[Y | D=1, class=k]

    sum survived if pclass == `k' & female == 0
    scalar mean_m`k' = r(mean)     // E[Y | D=0, class=k]

    scalar te`k' = mean_f`k' - mean_m`k'  // Within-stratum TE
    di "Class `k' survival gap (female - male): " te`k'
}

* ---------------------------------------------------------
* STEP 3: Compute ATE using population weights
* ATE = sum_k [ (E[Y|D=1,k] - E[Y|D=0,k]) * P(class=k) ]
* where P(class=k) is the proportion of ALL passengers in class k
* (not just male or female passengers).
* This reweights the within-class effects by the share of the
* population in each class, giving the effect for a randomly
* drawn passenger.
* ---------------------------------------------------------

* Total sample size
count
scalar N = r(N)

* Share of total sample in each class
forvalues k = 1/3 {
    count if pclass == `k'
    scalar w`k' = r(N) / N        // Population weight for class k
    di "Weight class `k': " w`k'
}

* ATE (subclassification estimator)
scalar ATE_sub = te1 * w1 + te2 * w2 + te3 * w3
di "ATE via subclassification = " ATE_sub
di "Naive ATE (no controls)   = " naive_ATE

* ---------------------------------------------------------
* (b) Discussion: See written answer below
* ---------------------------------------------------------

* ---------------------------------------------------------
* (c) Linear Probability Model — ATE via regression
* The LPM regresses the binary outcome (survived) on female
* and controls for class (as dummies) and age.
* Coefficient on female estimates the ATE of being female
* on survival probability, controlling for class and age.
* We use robust SEs because LPM fitted values are not
* bounded in [0,1], leading to heteroskedastic residuals
* even under correct specification.
* ---------------------------------------------------------

regress survived female i.pclass age, robust
* Coefficient on female = estimated ATE (LPM)
* Coefficients on 2.pclass and 3.pclass measure class gaps
* Coefficient on age measures age gradient in survival
estimates store lpm_base

* ---------------------------------------------------------
* (d) Interaction: Did the gender survival gap differ by class?
* We want to estimate:
*   delta = [E[Y|female,1st] - E[Y|male,1st]]
*         - [E[Y|female,other] - E[Y|male,other]]
* i.e., whether the gender gap is larger in first class.
* This requires adding an interaction term: female × firstclass.
* ---------------------------------------------------------

* Create interaction term manually (equivalent to ##)
gen female_x_first = female * firstclass
label variable female_x_first "Interaction: female × first class"

* Regression with interaction
* survived = b0 + b1*female + b2*firstclass + b3*(female×first) + b4*age + e
*
* b1 = gender survival gap in non-first classes (the "base" gender effect)
* b2 = survival advantage of first class for men
* b3 = ADDITIONAL gender gap in first class relative to non-first class
*      (this is the parameter of interest: tests whether gender-based
*       lifeboat allocation was more pronounced in first class)
* b4 = age gradient in survival (controlling for age composition)

regress survived female firstclass female_x_first age, robust
estimates store lpm_interact

* Test H0: b3 = 0 (no difference in gender gap across classes)
test female_x_first

* Alternative using factor variable notation (equivalent)
regress survived i.female##i.firstclass age, robust

log close
```

---

### Part (b): How Subclassification Changes Results

Subclassification produces a lower ATE than the naive difference-in-means. This is because the naive gap confounds the gender effect with the class effect: women are overrepresented in first and second class, where survival rates are higher for *both* genders due to lifeboat proximity. By computing the gender gap within each class and reweighting, subclassification removes this confounding.

The method relates directly to the ATE and CIA framework: under the assumption that conditional on passenger class, being female is as good as randomly assigned — $(y(0),y(1)) \perp D \mid \text{class}$ — the within-stratum differences are unbiased estimates of the class-specific CATE. The weighted average recovers the ATE using population weights. The key insight is that **selection into treatment (female) is correlated with selection into a favorable stratum (first class)**, so the naive estimate overstates the causal effect of gender on survival. Subclassification corrects for this observable heterogeneity. If there is additional unobserved confounding within classes (e.g., women of higher wealth within each class were also more likely to survive), the CIA fails and neither estimator is causal.

---

### Part (c): LPM Estimate of the ATE

```stata
regress survived female i.pclass age, robust
```

The OLS coefficient on `female` in this regression estimates the ATE of being female on survival probability, controlling linearly for class and age. Heteroscedasticity-robust standard errors are used because the LPM has $\text{Var}(u_i \mid \mathbf{X}_i) = p(\mathbf{X}_i)(1-p(\mathbf{X}_i))$, which depends on $\mathbf{X}_i$ by construction — this is structural heteroskedasticity that violates $\mathbb{E}[u_i^2 \mid \mathbf{X}_i] = \sigma^2$. Under the LPM, classical standard errors are invalid; robust SEs are required for valid inference.

---

### Part (d): Estimating Whether the Gender Survival Gap Differed by Class

**Estimand.** Define:

$$\delta = \underbrace{\left[\Pr(\text{survived} \mid \text{female, 1st class}) - \Pr(\text{survived} \mid \text{male, 1st class})\right]}_{\text{gender gap in 1st class}} - \underbrace{\left[\Pr(\text{survived} \mid \text{female, not 1st}) - \Pr(\text{survived} \mid \text{male, not 1st})\right]}_{\text{gender gap in non-1st classes}}$$

This is an interaction effect — whether the gender gap in survival was disproportionately large in first class relative to non-first classes.

**Modified Regression Equation.** Create a binary indicator $\text{First}_i = \mathbf{1}[\text{pclass} = 1]$ and the interaction $\text{Female}_i \times \text{First}_i$. The estimating equation is:

$$\text{survived}_i = \beta_0 + \beta_1 \text{Female}_i + \beta_2 \text{First}_i + \beta_3 (\text{Female}_i \times \text{First}_i) + \beta_4 \text{age}_i + u_i$$

The parameter of interest is $\beta_3$, which captures the additional gender gap in first class relative to non-first classes:

- $\beta_1$ = gender survival gap for non-first-class passengers
- $\beta_1 + \beta_3$ = gender survival gap for first-class passengers
- $\beta_3 = \delta$ = the differential gender gap across classes

**When must we control for age?** Age is a confounder for the gender gap within class if: (1) age predicts survival (older passengers may have deferred to younger ones), and (2) the age distribution differs between male and female passengers within each class. If within first class (or non-first classes), women were systematically younger than men AND younger passengers had higher survival rates, omitting age would create upward omitted variable bias in $\hat{\beta}_1$ and $\hat{\beta}_3$. In the Titanic context, this is plausible: the "women and children first" protocol suggests age may interact with gender in determining lifeboat access. Therefore, we include age to avoid OVB in the gender coefficient. If age were distributed identically across gender within each class, controlling for it would not affect the coefficient estimates (only precision).

```stata
* Estimate the differential gender survival gap between first and non-first class
gen female_x_first = female * firstclass

regress survived female firstclass female_x_first age, robust

* beta_3 (coeff on female_x_first) is the parameter of interest delta
* A positive and significant beta_3 means the gender gap was larger
* in first class than in non-first classes, consistent with first-class
* women receiving disproportionate access to lifeboats relative to
* first-class men compared to what occurred in other classes.

test female_x_first
```
