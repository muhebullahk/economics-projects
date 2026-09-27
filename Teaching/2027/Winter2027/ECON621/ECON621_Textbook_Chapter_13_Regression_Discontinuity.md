# Chapter 13: Regression Discontinuity Design

---

## Chapter Overview

**Regression Discontinuity Design (RDD)** exploits sharp thresholds in treatment assignment rules to identify causal effects. When treatment is determined by whether a continuous "running variable" crosses a threshold — a test score above 70% grants a scholarship; income below a cutoff qualifies for a social program — we can compare outcomes just above and just below the threshold to estimate a causal effect. The key insight is that individuals just above and just below the threshold are nearly identical in all characteristics, except their treatment status.

RDD has become one of the most widely used and credible identification strategies in applied economics, partly because its identifying assumptions are relatively transparent and can be subjected to rigorous validity tests.

---

## Learning Objectives

After completing this chapter, students will be able to:

1. Explain the **sharp RDD** setup and the identifying assumption of **continuity**.
2. Identify the **treatment effect estimated by RDD** and explain why it is a local effect.
3. Derive the **RDD estimator** as a difference in regression limits at the cutoff.
4. Describe and implement **local linear regression** for RDD estimation.
5. Explain **bandwidth selection** and the bias-variance tradeoff.
6. Describe the **fuzzy RDD** and its relationship to IV.
7. Conduct **validity tests**: density test, covariate balance, placebo cutoffs.
8. Apply RDD to canonical examples: Thistlethwaite-Campbell (1960), regression in test-score-based policy contexts.

---

## 13.1 The Regression Discontinuity Idea

### 13.1.1 Setup

Let $R_i$ be the **running variable** (also called the "forcing variable" or "assignment variable"). Treatment $D_i$ is assigned based on whether $R_i$ crosses a threshold $c$:

$$D_i = \mathbb{1}[R_i \geq c] \quad \text{(Sharp RDD)}$$

**Examples:**
- Test scores (R) determine scholarship eligibility (D): threshold at 70%.
- Age (R) determines pension eligibility (D): threshold at age 65.
- Birth weight (R) determines neonatal intensive care admission (D): threshold at 1500g.
- Vote share (R) determines election winner (D): threshold at 50%.

### 13.1.2 The Local Nature of RDD

RDD identifies a **local** causal effect — the treatment effect for individuals near the threshold, not for the full population. This is both a limitation and a strength:

- **Limitation:** May not generalize to individuals far from the cutoff.
- **Strength:** Near the cutoff, individuals just above and below are nearly identical — making the identifying assumption very credible.

---

## 13.2 The Sharp RDD

### 13.2.1 The CEF Near the Cutoff

For the sharp RDD, the average treatment effect at the threshold $c$ is:

$$\tau_{RDD} = \lim_{r \downarrow c} E[Y_i \mid R_i = r] - \lim_{r \uparrow c} E[Y_i \mid R_i = r]$$

This is the **jump** in the conditional mean of $Y$ at the threshold $c$.

**Definition 13.1 (Sharp RDD Estimand):** 

$$\tau_{RDD} = E[Y_{1i} - Y_{0i} \mid R_i = c]$$

This is the ATT for individuals at the threshold — those right on the margin of receiving treatment.

### 13.2.2 The Identifying Assumption: Continuity

**Assumption 13.1 (Continuity):** The conditional expectations $E[Y_{0i} \mid R_i = r]$ and $E[Y_{1i} \mid R_i = r]$ are continuous in $r$ at $r = c$.

**Interpretation:** In the absence of the threshold, the outcome would change smoothly as the running variable changes. There is no other discontinuity in outcomes at $c$.

This rules out:
- Other policies that change at exactly $r = c$.
- Individuals precisely manipulating $R_i$ to sort above or below $c$.
- Discontinuous changes in any confounder at $c$.

### 13.2.3 Identification

Under Assumption 13.1:

$$\lim_{r \downarrow c} E[Y_i \mid R_i = r] - \lim_{r \uparrow c} E[Y_i \mid R_i = r]$$

$$= E[Y_{1i} \mid R_i = c] - E[Y_{0i} \mid R_i = c] = \tau_{RDD}$$

The key insight: by continuity, the average untreated potential outcome $E[Y_{0i} \mid R_i = r]$ is approximately the same for individuals just above and just below the threshold. So the observed jump in $Y$ at the cutoff isolates the treatment effect.

---

## 13.3 Estimation: Local Linear Regression

### 13.3.1 Fitting Regression on Each Side

The naive approach: fit a separate polynomial regression on each side of the cutoff, then compare the intercepts at $c$:

**Left side** ($R_i < c$): $Y_i = f_L(R_i) + u_i$

**Right side** ($R_i \geq c$): $Y_i = f_R(R_i) + u_i$

$$\hat{\tau}_{RDD} = \hat{f}_R(c) - \hat{f}_L(c)$$

### 13.3.2 Local Linear Regression

The most common approach: use **local linear regression** (LLR), which fits a linear regression within a bandwidth $h$ on each side of the cutoff.

**Definition 13.2 (Local Linear Regression Estimator):** 

For the right limit: $\hat{\mu}_R = \hat{\beta}_{R0}$ from OLS of $Y_i$ on $(1, R_i - c)$ using only observations with $c \leq R_i \leq c + h$.

For the left limit: $\hat{\mu}_L = \hat{\beta}_{L0}$ from OLS of $Y_i$ on $(1, R_i - c)$ using only observations with $c - h \leq R_i < c$.

$$\hat{\tau}_{RDD}^{LLR} = \hat{\mu}_R - \hat{\mu}_L$$

**In one regression (common implementation):**

$$Y_i = \alpha + \tau D_i + \beta_1 (R_i - c) + \beta_2 D_i(R_i - c) + u_i$$

using only observations with $|R_i - c| \leq h$. The coefficient $\hat{\tau}$ is the RDD estimate.

This specification allows the slope of $Y$ on $R$ to differ on either side of the cutoff, which is important for flexibility.

### 13.3.3 Kernels and Weighting

To give more weight to observations near the threshold, use **kernel regression**. A common choice is the **triangular kernel**: $K(r) = (1 - |r|)\mathbb{1}[|r| \leq 1]$, which gives zero weight to observations at the bandwidth edge and maximum weight to observations at the cutoff.

Implementing triangular kernel in practice: compute weights $w_i = 1 - |R_i - c|/h$ and use WLS.

---

## 13.4 Bandwidth Selection

### 13.4.1 The Bias-Variance Tradeoff

The choice of bandwidth $h$ involves a fundamental tradeoff:

- **Larger $h$:** More observations, lower variance, but more bias (farther observations are less comparable).
- **Smaller $h$:** Fewer observations, higher variance, but less bias (observations are more comparable).

### 13.4.2 Optimal Bandwidth Selection

The **Mean Squared Error (MSE)**-optimal bandwidth balances bias and variance:

$$h^* = \arg\min_h \left[\text{Bias}(\hat{\tau})^2 + \text{Var}(\hat{\tau})\right]$$

**Calonico, Cattaneo, and Titiunik (2014)** (CCT) propose a data-driven bandwidth selector based on minimizing the asymptotic MSE of the RDD estimator. The `rdrobust` package in R implements this.

**Good practice:** Report results under multiple bandwidths. If estimates are sensitive to bandwidth choice, this is a concern. The CCT optimal bandwidth provides a principled default.

---

## 13.5 The Fuzzy RDD and Its Relationship to IV

### 13.5.1 Setup

In the **fuzzy RDD**, crossing the threshold changes the *probability* of treatment but does not perfectly determine it:

$$P(D_i = 1 \mid R_i = r) = \begin{cases} g_1(r) & \text{if } r \geq c \\ g_0(r) & \text{if } r < c \end{cases}$$

where there is a jump $g_1(c) - g_0(c) \neq 0$ but this jump is not a full $0 \to 1$ transition.

**Example:** A test score above a threshold makes individuals *eligible* for a program, but they must actively enroll. Some who score above the threshold don't enroll; some below find other ways to enroll.

### 13.5.2 Fuzzy RDD as IV

The fuzzy RDD estimator is:

$$\hat{\tau}^{fuzzy} = \frac{\lim_{r\downarrow c}E[Y\mid R=r] - \lim_{r\uparrow c}E[Y\mid R=r]}{\lim_{r\downarrow c}P(D=1\mid R=r) - \lim_{r\uparrow c}P(D=1\mid R=r)}$$

This is exactly the **Wald estimator** with the threshold indicator $\mathbb{1}[R_i \geq c]$ as the instrument:
- Numerator: reduced form (effect of threshold on $Y$).
- Denominator: first stage (effect of threshold on $D$).

The fuzzy RDD therefore inherits the LATE interpretation: it estimates the average effect of treatment for compliers — individuals near the threshold who are induced to take (or not take) treatment by the threshold rule.

---

## 13.6 Validity Tests

### 13.6.1 The Density Test (McCrary, 2008)

If individuals can manipulate the running variable to sort above the threshold (e.g., to get a scholarship), the assumption of quasi-random assignment near the threshold is violated.

**Test:** If there is manipulation, there will be a discontinuity in the **density of $R_i$** at $c$ — a "bunching" above the threshold.

The **McCrary (2008) density test** tests for a discontinuity in the density of the running variable at the cutoff. Rejection is evidence of manipulation and undermines the RDD design.

In R: `rddensity` package implements this test.

### 13.6.2 Covariate Balance

If the RDD is valid, covariates that are predetermined relative to the running variable (age, education, gender, baseline outcomes) should not jump at the threshold. **Test:** Run the same RDD regression using predetermined covariates as the outcome. Non-zero results indicate a problem.

### 13.6.3 Placebo Cutoffs

If we use an artificial cutoff away from the true cutoff, we should find no discontinuity in outcomes (since there is no treatment at the placebo cutoff). Significant effects at placebo cutoffs suggest confounds.

---

## 13.7 Empirical Illustration: Thistlethwaite and Campbell (1960)

### 13.7.1 The Original RDD Paper

Thistlethwaite and Campbell (1960) studied whether receiving a National Merit Award affected students' career aspirations. Awards were granted based on test scores exceeding a threshold.

**Running variable:** Test score.  
**Treatment:** Receiving a National Merit Award.  
**Outcome:** Career and educational aspirations.

Students just above and just below the threshold had nearly identical academic preparation (the difference in test score is negligible), but those above received recognition and financial support. Any discontinuity in outcomes at the threshold can be attributed to the award.

**This paper introduced RDD to social science.** While Thistlethwaite and Campbell did not use modern estimation methods, their design intuition was correct.

### 13.7.2 Modern Applications of RDD

RDD has been applied to a vast range of questions:

| Study | Running Variable | Threshold | Outcome |
|---|---|---|---|
| Lee (2008) | Vote share | 50% | Re-election incumbent advantage |
| Card et al. (2008) | Age | 65 (Medicare eligibility) | Health insurance, health outcomes |
| Angrist and Lavy (1999) | Class size formula | Maimonides rule | Student achievement |
| Dell (2010) | Poverty index | Eligibility cutoff | Economic development |

---

## Chapter Summary

- **RDD** exploits threshold-based treatment assignment to identify causal effects.
- The **continuity assumption** (outcomes are smooth in the running variable absent treatment) is the key identifying condition.
- The **RDD estimand** is the treatment effect at the threshold — a local effect for individuals right at the margin.
- **Local linear regression** within a bandwidth estimates the jump in conditional means at the cutoff.
- **Bandwidth selection** involves a bias-variance tradeoff; the CCT method provides a principled choice.
- The **fuzzy RDD** is an IV estimator using the threshold indicator as an instrument; it estimates the LATE for compliers near the threshold.
- **Validity tests** (density, covariate balance, placebo cutoffs) assess the plausibility of the continuity assumption.
- RDD estimates are local and may not generalize to populations far from the threshold.

---

## Key Terms

**Running variable** — the continuous variable whose value determines treatment.

**Cutoff** — the threshold value of the running variable at which treatment changes.

**Sharp RDD** — treatment is perfectly determined by the running variable crossing the threshold.

**Fuzzy RDD** — crossing the threshold changes the probability but not the certainty of treatment.

**Continuity assumption** — conditional means are continuous in the running variable at the cutoff.

**Local linear regression (LLR)** — fitting a linear regression within a bandwidth on each side of the cutoff.

**Bandwidth** — the window around the cutoff used for estimation.

**McCrary density test** — test for a discontinuity in the density of the running variable at the cutoff.

**Placebo cutoffs** — testing for discontinuities at false cutoffs to assess confounds.

---

## Exercises

### Conceptual Questions

**13.1** Explain the continuity assumption in plain language. What does it mean about individuals near the threshold?

**13.2** Why is the effect estimated by RDD "local"? Does this make RDD less useful than DiD or IV?

**13.3** Explain why the fuzzy RDD is equivalent to IV with the threshold indicator as the instrument. What is the LATE interpretation of the fuzzy RDD?

**13.4** Describe three validity tests for RDD. What does each test check?

**13.5** A researcher studies the effect of receiving a college scholarship (awarded to students scoring above 80 on a national exam) on college enrollment. The density of test scores shows a sharp spike just above 80. What does this suggest? How does it affect the validity of the RDD?

### Analytical Questions

**13.6** Suppose the true outcome equation is $Y_i = \tau D_i + g(R_i) + u_i$, where $g(r)$ is a smooth function. Derive the RDD estimator and show it identifies $\tau$ under the continuity assumption.

**13.7** In a fuzzy RDD, the reduced form estimate is 0.08 and the first stage estimate is 0.40. Compute the LATE. What is the LATE interpretation?

### Applied Questions

**13.8** Using the `rdrobust` package in R, implement a sharp RDD:
(a) Plot the running variable and outcomes around the cutoff.
(b) Conduct a density test for manipulation.
(c) Estimate the RDD effect using local linear regression with the CCT optimal bandwidth.
(d) Check covariate balance at the cutoff.
(e) Assess sensitivity to bandwidth choice.

---

## R Lab 13: Regression Discontinuity Design

### Setup

```r
library(tidyverse)
library(rdrobust)    # RDD estimation and inference
library(rddensity)   # McCrary density test
library(ggplot2)

# Simulate RDD data
set.seed(42)
n <- 2000
c <- 0  # cutoff

R <- runif(n, -1, 1)    # running variable
D <- as.integer(R >= c)  # sharp treatment

# True treatment effect: tau = 0.5
tau <- 0.5
Y <- 2 + tau * D + 0.8 * R + rnorm(n, sd = 0.5)

df_rdd <- data.frame(R = R, D = D, Y = Y)
```

### Exercise 13.1: Visualizing the Discontinuity

```r
# Bin means plot
df_rdd <- df_rdd %>%
  mutate(bin = cut(R, breaks = 40))

bin_means <- df_rdd %>%
  group_by(bin, D) %>%
  summarise(Y_mean = mean(Y), R_mean = mean(R), .groups = "drop")

ggplot(bin_means, aes(x = R_mean, y = Y_mean, color = factor(D))) +
  geom_point(size = 2) +
  geom_vline(xintercept = 0, linetype = "dashed") +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "RDD: Outcome vs. Running Variable",
    subtitle = "Clear jump at cutoff (R = 0)",
    x = "Running Variable (R)", y = "Mean Outcome", color = "Treated"
  ) +
  theme_minimal()
```

### Exercise 13.2: Density Test

```r
# McCrary density test
density_test <- rddensity(R, c = c)
summary(density_test)
rdplotdensity(density_test, R)
```

### Exercise 13.3: Local Linear RDD Estimation

```r
# RDD estimate with optimal bandwidth
rdd_est <- rdrobust(Y, R, c = c, kernel = "triangular", bwselect = "mserd")
summary(rdd_est)

cat("RDD estimate:", round(rdd_est$coef["Conventional"], 3), "\n")
cat("95% CI: [", round(rdd_est$ci["Robust", 1], 3), ",",
                 round(rdd_est$ci["Robust", 2], 3), "]\n")
cat("Optimal bandwidth:", round(rdd_est$bws["h", "left"], 3), "\n")
```

### Exercise 13.4: Covariate Balance

```r
# Generate a predetermined covariate
X_cov <- 0.3 * R + rnorm(n)  # correlated with R but not jumping at cutoff

# RDD of covariate on running variable (should find no discontinuity)
rdd_cov <- rdrobust(X_cov, R, c = c)
summary(rdd_cov)
cat("Covariate RDD estimate (should be ~0):", round(rdd_cov$coef["Conventional"], 3), "\n")
```

### Exercise 13.5: Sensitivity to Bandwidth

```r
# Estimate over a range of bandwidths
h_grid <- seq(0.1, 0.8, by = 0.05)
results <- map_dfr(h_grid, function(h) {
  est <- rdrobust(Y, R, c = c, h = h)
  data.frame(h = h, estimate = est$coef["Conventional"],
             ci_low = est$ci["Robust", 1], ci_high = est$ci["Robust", 2])
})

ggplot(results, aes(x = h, y = estimate)) +
  geom_ribbon(aes(ymin = ci_low, ymax = ci_high), alpha = 0.2, fill = "steelblue") +
  geom_line(color = "steelblue", linewidth = 1) +
  geom_hline(yintercept = tau, color = "red", linetype = "dashed") +
  labs(
    title = "RDD Estimate Across Bandwidths",
    subtitle = "Red dashed = true effect. Estimate is stable across bandwidths.",
    x = "Bandwidth (h)", y = "RDD Estimate"
  ) +
  theme_minimal()
```

---

*End of Chapter 13*

---

**References**

Thistlethwaite, D. L., and Campbell, D. T. (1960). Regression-discontinuity analysis: An alternative to the ex post facto experiment. *Journal of Educational Psychology*, 51(6), 309–317.

Lee, D. S., and Lemieux, T. (2010). Regression discontinuity designs in economics. *Journal of Economic Literature*, 48(2), 281–355.

Calonico, S., Cattaneo, M. D., and Titiunik, R. (2014). Robust nonparametric confidence intervals for regression-discontinuity designs. *Econometrica*, 82(6), 2295–2326.

McCrary, J. (2008). Manipulation of the running variable in the regression discontinuity design: A density test. *Journal of Econometrics*, 142(2), 698–714.

Angrist, J. D., and Lavy, V. (1999). Using Maimonides' rule to estimate the effect of class size on scholastic achievement. *Quarterly Journal of Economics*, 114(2), 533–575.

Cunningham, S. (2021). *Causal Inference: The Mixtape*. Chapter 6.
