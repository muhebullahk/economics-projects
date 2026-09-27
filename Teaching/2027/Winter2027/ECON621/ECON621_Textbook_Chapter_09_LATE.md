# Chapter 9: Heterogeneous Treatment Effects and the Local Average Treatment Effect

---

## Chapter Overview

Chapter 8 presented IV as a solution to endogeneity when the exclusion restriction holds. But what does IV actually estimate when treatment effects are heterogeneous — when the effect of the treatment varies across individuals? This chapter answers that question using the **potential outcomes framework** developed in Chapter 1.

The central result — the **LATE Theorem** of Imbens and Angrist (1994) — shows that IV with a binary instrument estimates the **Local Average Treatment Effect**: the average causal effect for a specific subpopulation called **compliers** — individuals whose treatment status is affected by the instrument. This has profound implications for interpreting IV estimates and designing empirical research.

---

## Learning Objectives

After completing this chapter, students will be able to:

1. Explain the limitations of the **constant-effects model** and why heterogeneous effects matter.
2. Define **potential outcomes** for both the outcome and the treatment.
3. Define the four **compliance types** (always-takers, never-takers, compliers, defiers).
4. State the four **LATE assumptions** (independence, exclusion, first stage, monotonicity).
5. State and prove the **LATE Theorem** (Imbens and Angrist, 1994).
6. Interpret IV estimates as LATE, and understand when LATE differs from ATE.
7. Explain the relationship between the **Wald estimator** and LATE.
8. Apply the LATE framework to canonical examples (Vietnam draft lottery, compulsory schooling).

---

## 9.1 The Constant-Effects Model and Its Limitations

In Chapter 8 (and Chapter 1), we wrote the structural equation as:

$$Y_i = \alpha + \rho D_i + u_i$$

where $\rho = Y_{1i} - Y_{0i}$ is the same for everyone — the **constant-effects model**.

This assumption is convenient but unrealistic. In labour economics, the return to education varies by individual ability, occupation, and timing. In health economics, the effect of a treatment varies by disease severity. In program evaluation, training program effects vary by background and motivation.

**The question this chapter answers:** When effects are heterogeneous and we use an IV estimator, what causal parameter does it recover?

---

## 9.2 The Potential Outcomes Framework Revisited

We now have potential outcomes for **both** the treatment and the outcome.

**Potential treatments:** For each individual $i$ and each possible value of the instrument $Z_i \in \{0,1\}$:

$$D_{0i} = \text{treatment status individual } i \text{ would take if } Z_i = 0$$
$$D_{1i} = \text{treatment status individual } i \text{ would take if } Z_i = 1$$

**Potential outcomes:** Given treatment $d \in \{0,1\}$:

$$Y_{di} = \text{outcome individual } i \text{ would experience if } D_i = d$$

**Observed outcomes** (via the switching equations):

$$D_i = D_{0i} + (D_{1i} - D_{0i})Z_i$$
$$Y_i = Y_{0i} + (Y_{1i} - Y_{0i})D_i$$

---

## 9.3 SUTVA

A key background assumption is **Stable Unit Treatment Value Assumption (SUTVA)**:

**Assumption 9.1 (SUTVA):** 
1. **No interference:** One unit's treatment does not affect another's outcomes.
2. **No hidden versions of treatment:** There is only one version of each treatment level.

SUTVA allows us to write individual potential outcomes without conditioning on others' treatments. It fails in settings with spillovers (e.g., vaccination programs that create herd immunity) or when there are multiple treatment variants (e.g., different types of job training).

---

## 9.4 Compliance Types: Always-Takers, Never-Takers, Compliers, Defiers

Given the instrument $Z_i$ and potential treatments $D_{0i}, D_{1i}$, we can classify all individuals into four compliance types:

| Type | $D_{0i}$ | $D_{1i}$ | Behavior |
|---|---|---|---|
| **Always-takers** | 1 | 1 | Take treatment regardless of $Z$ |
| **Never-takers** | 0 | 0 | Never take treatment regardless of $Z$ |
| **Compliers** | 0 | 1 | Take treatment when $Z=1$, not when $Z=0$ |
| **Defiers** | 1 | 0 | Take treatment when $Z=0$, not when $Z=1$ |

**Key insight:** 
- We can **never directly observe** which type an individual is, because we observe only one of $D_{0i}$ or $D_{1i}$.
- Always-takers and never-takers are "uninformative" about the causal effect — their treatment status doesn't change with the instrument.
- The instrument only affects the treatment of **compliers** (and defiers).

**Example 9.1 (Vietnam Draft Lottery):** Consider a lottery that drafts men into military service. 
- Always-takers: men who volunteer regardless of whether they're drafted.
- Never-takers: men who avoid service regardless (flee the country, obtain exemptions).
- Compliers: men who serve if drafted and don't serve if not drafted.
- Defiers: men who serve only when NOT drafted (unlikely to exist).

---

## 9.5 The Four LATE Assumptions

**Assumption 9.2 (Independence / Random Assignment):**

$$(Y_{0i}, Y_{1i}, D_{0i}, D_{1i}) \perp\!\!\!\perp Z_i$$

The instrument $Z_i$ is independent of all potential outcomes and potential treatments. This is satisfied by random assignment.

**Assumption 9.3 (Exclusion Restriction):**

$$Y_{di} = Y_{di}(Z_i) \text{ for } d \in \{0,1\}$$

Or more precisely: the instrument affects outcomes only through the treatment channel. $Z_i$ has no direct effect on $Y_i$ given $D_i$.

**Assumption 9.4 (First Stage / Relevance):**

$$E[D_{1i} - D_{0i}] \neq 0$$

The instrument has a non-zero (on average) effect on the treatment. 

**Assumption 9.5 (Monotonicity):**

$$D_{1i} \geq D_{0i} \text{ for all } i \quad \text{(or } D_{1i} \leq D_{0i} \text{ for all } i)$$

The instrument shifts treatment in the same direction for everyone. This rules out defiers: if $Z = 1$ increases treatment for some, it does not decrease treatment for others.

The combination of the first-stage and monotonicity assumptions implies that the complier fraction is positive: $P(D_{1i} > D_{0i}) > 0$.

---

## 9.6 The LATE Theorem

**Theorem 9.1 (Imbens and Angrist, 1994):** Under Assumptions 9.2–9.5, the IV/Wald estimator identifies the **Local Average Treatment Effect**:

$$\text{LATE} \equiv E[Y_{1i} - Y_{0i} \mid D_{1i} > D_{0i}] = \frac{E[Y_i \mid Z_i = 1] - E[Y_i \mid Z_i = 0]}{E[D_i \mid Z_i = 1] - E[D_i \mid Z_i = 0]}$$

The LATE is the average treatment effect for the subpopulation of **compliers** — those individuals for whom $D_{1i} > D_{0i}$ (who are induced into treatment by the instrument).

**Proof:**

**Denominator (First Stage):**

$$E[D_i \mid Z_i = 1] - E[D_i \mid Z_i = 0]$$

By independence (Assumption 9.2): $E[D_i \mid Z_i = z] = E[D_{zi}]$.

$$= E[D_{1i}] - E[D_{0i}] = E[D_{1i} - D_{0i}]$$

By monotonicity: $D_{1i} - D_{0i} \in \{0, 1\}$ (no defiers means the difference is either 0 or 1). So:

$$= P(D_{1i} > D_{0i}) = P(\text{Complier})$$

**Numerator (Reduced Form):**

$$E[Y_i \mid Z_i = 1] - E[Y_i \mid Z_i = 0]$$

By independence and the switching equation:

$$= E[Y_{D_{1i}, i}] - E[Y_{D_{0i}, i}]$$

$$= E[Y_{1i} D_{1i} + Y_{0i}(1-D_{1i})] - E[Y_{1i} D_{0i} + Y_{0i}(1-D_{0i})]$$

$$= E[(Y_{1i} - Y_{0i})(D_{1i} - D_{0i})]$$

By monotonicity, $D_{1i} - D_{0i} \geq 0$, so:

$$= E[(Y_{1i} - Y_{0i})(D_{1i} - D_{0i})]$$

$$= E[Y_{1i} - Y_{0i} \mid D_{1i} > D_{0i}] \cdot P(D_{1i} > D_{0i})$$

(the always-takers and never-takers have $D_{1i} = D_{0i}$, so they contribute zero to the sum).

**Combining:**

$$\frac{\text{Numerator}}{\text{Denominator}} = \frac{E[Y_{1i} - Y_{0i} \mid D_{1i} > D_{0i}] \cdot P(\text{Complier})}{P(\text{Complier})} = E[Y_{1i} - Y_{0i} \mid D_{1i} > D_{0i}] = \text{LATE} \quad \square$$

---

## 9.7 Interpreting LATE

### 9.7.1 Who Are Compliers?

Compliers are the people "on the margin" between treatment and control who are moved by the instrument. Their identity depends on what the instrument is:

- **Vietnam draft lottery (Angrist, 1990):** Compliers are men who served in the military because they were drafted, but would not have served voluntarily.
- **Compulsory schooling (Angrist-Krueger, 1991):** Compliers are individuals who stayed in school because they weren't old enough to drop out by the end of the term, and would have dropped out otherwise.
- **College proximity (Card, 1995):** Compliers are individuals who attended college because a college was nearby, and would not have attended otherwise.

### 9.7.2 LATE vs. ATE vs. ATT

In general, **LATE ≠ ATE ≠ ATT** when:

1. Treatment effects are heterogeneous (vary across individuals).
2. The complier group differs systematically from the full population.

| Parameter | Population | Method of identification |
|---|---|---|
| ATE | Full population | Random assignment to all |
| ATT | Treated units | Selection on observables (CIA) |
| LATE | Compliers | Instrumental variable |

**When does LATE ≈ ATE?**
- When treatment effects are homogeneous.
- When compliers are representative of the full population.

**When does LATE ≠ ATE?**
- When the instrument selects a non-representative subset. The Vietnam draft lottery compliers are men who didn't volunteer — possibly those with lower "returns" to military service.

### 9.7.3 LATE and External Validity

The LATE from one instrument is not necessarily the same as the LATE from another instrument — even when both instruments are valid. Different instruments define different complier populations.

**Example:** Two valid instruments for education:
1. Quarter of birth (Angrist-Krueger): compliers are people who wanted to drop out as soon as legally allowed.
2. College proximity (Card): compliers are people who would have attended college if it were nearby.

These two groups likely have very different returns to education. This means the two IV estimates can legitimately differ — not because one is wrong, but because they estimate different parameters for different populations.

This has profound implications for **external validity**: an IV estimate tells you the causal effect for the compliers defined by that specific instrument, not necessarily the effect for the average person or for a new policy context.

---

## 9.8 2SLS as LATE with Multiple Instruments

When there are multiple instruments $Z_1, Z_2, \ldots, Z_\ell$ for a single endogenous variable, 2SLS combines them. Under the LATE framework:

$$\hat{\rho}^{2SLS} \xrightarrow{p} \sum_{j=1}^\ell \omega_j \cdot \text{LATE}_j$$

where $\text{LATE}_j$ is the LATE defined by instrument $Z_j$ (the effect for compliers of instrument $j$) and $\omega_j$ are weights that sum to one. The weights are proportional to the variance of the first-stage predictions from each instrument.

This means 2SLS with multiple instruments estimates a **weighted average of LATEs** — a complex estimand whose interpretation requires care.

---

## 9.9 Empirical Applications

### 9.9.1 Application 1: Vietnam Draft Lottery (Angrist, 1990)

**Research question:** What is the effect of military service on lifetime earnings?

**Identification problem:** Veterans and non-veterans differ systematically in many ways (selection into service). OLS estimates of the effect of veteran status are confounded by these differences.

**Instrument:** Vietnam-era draft lottery. Men born in years 1950–1953 were assigned draft lottery numbers 1–365 based on birthday. Low lottery numbers were called first; men with numbers below a threshold were drafted.

**Validity:**
- **Independence:** Lottery numbers were randomly assigned (approximately).
- **Exclusion:** Lottery number affects earnings only through military service (no direct effect of knowing your lottery number on future earnings).
- **First stage:** Being assigned a low lottery number significantly increases the probability of military service.
- **Monotonicity:** Low numbers increase service (no defiers expected).

**Results:** IV (Wald) estimates suggest military service reduced civilian earnings by approximately 15% for compliers (white veterans), with effects persisting for at least 15 years. The OLS estimate was biased upward because veterans tend to come from lower-income backgrounds (attenuation by selection).

**Who are the compliers?** Men who were called up by the draft lottery and served. These are NOT representative of all veterans (who also include volunteers) and NOT representative of all men (since many draft-eligible men found other ways to avoid service).

### 9.9.2 Application 2: Compulsory Schooling (Angrist and Krueger, 1991)

As discussed in Chapter 8:

**Compliers:** Men who would have dropped out of school as soon as legally permitted (when they turned 16 or after completing the grade they were enrolled in at age 16), but who in fact had to stay in school longer because they started school at a younger age (and were thus younger than the dropout cutoff when they reached certain grades).

**LATE interpretation:** The Angrist-Krueger estimates measure the return to education for this specific group of marginal students — those constrained by compulsory schooling laws. The returns for this group may be higher or lower than for the average student.

---

## Chapter Summary

- With heterogeneous treatment effects, the question "what does IV estimate?" is non-trivial.
- The **LATE Theorem** shows that IV identifies the average treatment effect for **compliers** — those whose treatment is affected by the instrument.
- The four LATE assumptions are: independence, exclusion restriction, first stage, and monotonicity.
- **Always-takers** and **never-takers** contribute no information to the IV estimate; their effects are "washed out."
- **LATE ≠ ATE** when compliers are not representative of the full population.
- Different instruments define different complier populations and may give different (but all valid) estimates.
- The LATE framework forces us to be explicit about *which population* our IV estimate describes — crucial for policy relevance.

---

## Key Terms

**SUTVA** — Stable Unit Treatment Value Assumption; no interference between units, no hidden treatment versions.

**Potential treatments** — $D_{0i}$ and $D_{1i}$: treatment under $Z_i = 0$ and $Z_i = 1$.

**Compliance types** — always-takers, never-takers, compliers, defiers.

**Compliers** — individuals with $D_{1i} > D_{0i}$; treatment is affected by the instrument.

**Monotonicity** — no defiers: $D_{1i} \geq D_{0i}$ for all $i$.

**LATE (Local Average Treatment Effect)** — $E[Y_{1i} - Y_{0i} \mid D_{1i} > D_{0i}]$; average effect for compliers.

**ATE** — $E[Y_{1i} - Y_{0i}]$; average effect for the full population.

**External validity** — whether an estimate from one context generalizes to another.

---

## Exercises

### Conceptual Questions

**9.1** Explain in your own words why IV estimates LATE rather than ATE.

**9.2** A researcher uses random assignment of a health insurance subsidy as an instrument for health insurance take-up, to estimate the effect of insurance on health outcomes. Who are the compliers in this setting? Who are the always-takers and never-takers? Does LATE have a meaningful policy interpretation?

**9.3** Why is monotonicity an important assumption for the LATE theorem? What would happen if defiers existed?

**9.4** Two researchers use different instruments to estimate the return to education. Researcher A uses college proximity; Researcher B uses compulsory schooling laws. Both produce valid IV estimates. Explain why the two estimates might differ even though both are valid.

**9.5** Evaluate this statement: "Since IV estimates LATE for compliers, and compliers are a small fraction of the population, IV estimates are not useful for policy."

### Analytical Questions

**9.6** Prove the LATE Theorem carefully. Specifically, show that:
(a) The denominator of the Wald estimator equals $P(\text{Complier})$.
(b) The numerator equals $E[Y_{1i} - Y_{0i} \mid \text{Complier}] \times P(\text{Complier})$.

**9.7** Suppose the population is 20% always-takers (TE = $\tau_{AT}$), 50% never-takers (TE = $\tau_{NT}$), and 30% compliers (TE = $\tau_C$). Express the ATE in terms of $\tau_{AT}$, $\tau_{NT}$, $\tau_C$. Under what conditions does LATE = ATE?

**9.8** In the draft lottery example, suppose:
- $P(\text{Complier}) = 0.16$ (16% of eligible men were induced to serve by the lottery).
- $E[Y_i \mid Z_i = 1] - E[Y_i \mid Z_i = 0] = -0.024$ (2.4% reduction in earnings from being in a low-lottery cohort).
- $E[D_i \mid Z_i = 1] - E[D_i \mid Z_i = 0] = 0.16$.

Compute the LATE. Interpret it.

### Applied Questions

**9.9** In R, simulate the LATE framework:
- Create a population of 10,000 with 4 compliance types.
- Assign a binary instrument $Z_i$ randomly.
- Compute the Wald estimator and show it equals the average treatment effect for compliers.

---

## R Lab 9: Simulating the LATE Framework

### Exercise 9.1: Simulating Compliance Types

```r
library(tidyverse)
set.seed(2024)
n <- 10000

# Define compliance types (known only to God!)
type <- sample(c("always_taker", "never_taker", "complier", "defier"),
               n, replace = TRUE,
               prob = c(0.20, 0.30, 0.45, 0.05))

# Potential treatment under Z=0 and Z=1
D0 <- ifelse(type %in% c("always_taker", "defier"), 1, 0)
D1 <- ifelse(type %in% c("always_taker", "complier"), 1, 0)

# True heterogeneous treatment effects by type
te <- case_when(
  type == "always_taker" ~ rnorm(n, 5, 2),
  type == "never_taker"  ~ rnorm(n, 3, 2),
  type == "complier"     ~ rnorm(n, 8, 2),  # compliers have higher returns
  type == "defier"       ~ rnorm(n, 1, 2)
)

# Potential outcomes
Y0 <- rnorm(n, 10, 3)         # baseline untreated outcome
Y1 <- Y0 + te                  # treated outcome

# Randomly assign instrument
Z  <- rbinom(n, 1, 0.5)

# Observed treatment and outcome
D  <- ifelse(Z == 1, D1, D0)
Y  <- ifelse(D == 1, Y1, Y0)

df_late <- data.frame(Z, D, Y, type, te, D0, D1)
```

### Exercise 9.2: Computing the LATE

```r
# True LATE (average treatment effect for compliers)
true_LATE <- mean(te[type == "complier"])
cat("True LATE (compliers only):", round(true_LATE, 4), "\n")

# True ATE
true_ATE <- mean(te)
cat("True ATE:", round(true_ATE, 4), "\n")

# Wald estimator (IV)
Y_Z1 <- mean(Y[Z == 1])
Y_Z0 <- mean(Y[Z == 0])
D_Z1 <- mean(D[Z == 1])
D_Z0 <- mean(D[Z == 0])

wald_est <- (Y_Z1 - Y_Z0) / (D_Z1 - D_Z0)
cat("Wald (IV) estimate:", round(wald_est, 4), "\n")
cat("Complier share:", round(D_Z1 - D_Z0, 4), "\n")
```

### Exercise 9.3: IV Regression via ivreg

```r
library(ivreg)
iv_model <- ivreg(Y ~ D | Z, data = df_late)
summary(iv_model)
cat("ivreg IV estimate:", round(coef(iv_model)["D"], 4), "\n")
```

### Exercise 9.4: Distribution of Treatment Effects by Type

```r
df_late %>%
  ggplot(aes(x = te, fill = type)) +
  geom_density(alpha = 0.5) +
  geom_vline(xintercept = true_LATE, linetype = "dashed", color = "red") +
  geom_vline(xintercept = true_ATE, linetype = "dotted", color = "blue") +
  labs(
    title = "Heterogeneous Treatment Effects by Compliance Type",
    subtitle = "Red: LATE (complier mean); Blue: ATE (population mean)",
    x = "Individual Treatment Effect",
    y = "Density",
    fill = "Compliance Type"
  ) +
  theme_minimal()
```

---

*End of Chapter 9*

---

**References**

Imbens, G. W., and Angrist, J. D. (1994). Identification and estimation of local average treatment effects. *Econometrica*, 62(2), 467–475.

Angrist, J. D. (1990). Lifetime earnings and the Vietnam era draft lottery: Evidence from social security administrative records. *American Economic Review*, 80(3), 313–336.

Angrist, J. D., and Krueger, A. B. (1991). Does compulsory school attendance affect schooling and earnings? *Quarterly Journal of Economics*, 106(4), 979–1014.

Card, D. (1995). Using geographic variation in college proximity to estimate the return to schooling. University of Toronto Press.

Angrist, J. D., and Pischke, J. (2009). *Mostly Harmless Econometrics*. Chapter 4.

Cunningham, S. (2021). *Causal Inference: The Mixtape*. Chapter 7.
