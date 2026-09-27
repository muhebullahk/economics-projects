# Chapter 5: Asymptotic Theory and Robust Inference

---

## Chapter Overview

Chapter 4 derived exact finite-sample results under the strong assumption that errors are normally distributed. In practice, economic data are rarely normally distributed: wages are right-skewed, binary outcomes are Bernoulli, error variances vary across observations. This chapter develops **asymptotic (large-sample) theory** — statistical results that hold approximately when $n$ is large, without requiring normality or homoskedasticity.

We derive the **asymptotic distribution of OLS**, show how to estimate the asymptotic variance under **heteroskedasticity** (non-constant variance) and **within-cluster correlation**, and provide practical guidance on when and how to use robust standard errors. These are the standard errors used in virtually all applied economic research today.

---

## Learning Objectives

After completing this chapter, students will be able to:

1. Explain why asymptotic theory is needed in applied econometrics.
2. State and apply the **Law of Large Numbers (LLN)** and **Central Limit Theorem (CLT)** to OLS.
3. Prove **consistency** of OLS under weaker conditions than Gauss-Markov.
4. Derive the **asymptotic distribution** of the OLS estimator.
5. Explain what **heteroskedasticity** is and why it invalidates classical standard errors.
6. Compute and interpret **heteroskedasticity-robust (HC) standard errors**.
7. Explain **cluster-robust standard errors** and when clustering is necessary.
8. Provide practical guidance on standard error choice in applied work.

---

## 5.1 Why Asymptotic Theory?

The Gauss-Markov assumptions, particularly normality (Assumption 4.5), are often implausible:

- **Discrete outcomes:** Earnings rounded to the nearest dollar, binary indicators of employment, counts of accidents. Error distributions are clearly non-normal.
- **Non-spherical errors:** Wages vary more for high earners (heteroskedasticity); students in the same class share correlated outcomes (clustering); annual firm data have autocorrelated shocks.
- **Misspecified functional form:** When the CEF is non-linear, OLS residuals systematically deviate from normality.

When the classical assumptions fail, we need **asymptotic theory** — results that hold as $n \to \infty$ under weaker conditions. The key tools are the **Law of Large Numbers** (sample averages converge to population means) and the **Central Limit Theorem** (standardized sample averages are approximately normal for large $n$).

---

## 5.2 Consistency of OLS

**Definition 5.1 (Consistency):** An estimator $\hat{\boldsymbol{\beta}}_n$ is **consistent** for $\boldsymbol{\beta}$ if $\hat{\boldsymbol{\beta}}_n \xrightarrow{p} \boldsymbol{\beta}$ as $n \to \infty$. That is, for any $\epsilon > 0$:
$$\lim_{n \to \infty} P(\|\hat{\boldsymbol{\beta}}_n - \boldsymbol{\beta}\| > \epsilon) = 0$$

**Theorem 5.1 (Consistency of OLS):** Suppose the following conditions hold:
1. The model is linear: $y_i = \mathbf{x}_i^T \boldsymbol{\beta} + u_i$.
2. The data $\{(y_i, \mathbf{x}_i)\}$ are i.i.d.
3. **Predeterminedness:** $E[\mathbf{x}_i u_i] = \mathbf{0}$ (orthogonality condition).
4. $E[\mathbf{x}_i \mathbf{x}_i^T]$ is finite and non-singular.

Then $\hat{\boldsymbol{\beta}}^{OLS} \xrightarrow{p} \boldsymbol{\beta}$.

**Proof:**

$$\hat{\boldsymbol{\beta}} = \boldsymbol{\beta} + \left(\frac{1}{n}\mathbf{X}^T\mathbf{X}\right)^{-1} \left(\frac{1}{n}\mathbf{X}^T\mathbf{u}\right)$$

By the LLN:
$$\frac{1}{n}\mathbf{X}^T\mathbf{X} = \frac{1}{n}\sum_{i=1}^n \mathbf{x}_i \mathbf{x}_i^T \xrightarrow{p} E[\mathbf{x}_i \mathbf{x}_i^T] \equiv \mathbf{S}_{XX}$$

$$\frac{1}{n}\mathbf{X}^T\mathbf{u} = \frac{1}{n}\sum_{i=1}^n \mathbf{x}_i u_i \xrightarrow{p} E[\mathbf{x}_i u_i] = \mathbf{0}$$

By Slutsky's theorem and the continuous mapping theorem:

$$\hat{\boldsymbol{\beta}} \xrightarrow{p} \boldsymbol{\beta} + \mathbf{S}_{XX}^{-1} \mathbf{0} = \boldsymbol{\beta} \quad \square$$

### 5.2.1 Consistency vs. Unbiasedness

**Key distinction:** Consistency only requires the weaker condition $E[\mathbf{x}_i u_i] = \mathbf{0}$ (predeterminedness / zero covariance), not strict exogeneity $E[u_i \mid \mathbf{X}] = \mathbf{0}$.

- Strict exogeneity $\Rightarrow$ predeterminedness, but NOT vice versa.
- Predeterminedness is enough for consistency; strict exogeneity is needed for unbiasedness.

This means OLS can be **consistent but biased in small samples** — the bias vanishes as $n \to \infty$.

**Practical implication:** In many panel data models (with lagged dependent variables), OLS is biased in small samples but consistent in large samples. For small panels, this bias can be substantial.

---

## 5.3 Asymptotic Normality and the Sandwich Variance

**Theorem 5.2 (Asymptotic Normality of OLS):** Under the i.i.d. assumptions of Theorem 5.1, plus $E[\mathbf{x}_i \mathbf{x}_i^T u_i^2]$ finite:

$$\sqrt{n}(\hat{\boldsymbol{\beta}} - \boldsymbol{\beta}) \xrightarrow{d} N\!\left(\mathbf{0}, \mathbf{S}_{XX}^{-1} \boldsymbol{\Omega} \mathbf{S}_{XX}^{-1}\right)$$

where $\mathbf{S}_{XX} = E[\mathbf{x}_i \mathbf{x}_i^T]$ and $\boldsymbol{\Omega} = E[\mathbf{x}_i \mathbf{x}_i^T u_i^2] = E[u_i^2 \mathbf{x}_i \mathbf{x}_i^T]$.

**Proof:** The key step is applying the **Multivariate Central Limit Theorem (MCLT)** to $\frac{1}{\sqrt{n}}\mathbf{X}^T\mathbf{u}$:

$$\frac{1}{\sqrt{n}}\mathbf{X}^T\mathbf{u} = \frac{1}{\sqrt{n}}\sum_{i=1}^n \mathbf{x}_i u_i \xrightarrow{d} N(\mathbf{0}, \boldsymbol{\Omega})$$

By the LLN, $\frac{1}{n}\mathbf{X}^T\mathbf{X} \xrightarrow{p} \mathbf{S}_{XX}$. By Slutsky's theorem:

$$\sqrt{n}(\hat{\boldsymbol{\beta}} - \boldsymbol{\beta}) = \left(\frac{1}{n}\mathbf{X}^T\mathbf{X}\right)^{-1} \frac{1}{\sqrt{n}}\mathbf{X}^T\mathbf{u} \xrightarrow{d} \mathbf{S}_{XX}^{-1} \cdot N(\mathbf{0}, \boldsymbol{\Omega}) = N(\mathbf{0}, \mathbf{S}_{XX}^{-1}\boldsymbol{\Omega}\mathbf{S}_{XX}^{-1}) \quad \square$$

### 5.3.1 The Sandwich Variance Estimator

The matrix $\mathbf{S}_{XX}^{-1}\boldsymbol{\Omega}\mathbf{S}_{XX}^{-1}$ is called the **sandwich variance** (or **Huber-White** variance). In finite samples:

$$\text{Var}(\hat{\boldsymbol{\beta}}) \approx \frac{1}{n} \mathbf{S}_{XX}^{-1} \boldsymbol{\Omega} \mathbf{S}_{XX}^{-1} = (\mathbf{X}^T\mathbf{X})^{-1}\left[\mathbf{X}^T\boldsymbol{\Omega}\mathbf{X}\right](\mathbf{X}^T\mathbf{X})^{-1}$$

**Under homoskedasticity:** $E[u_i^2 \mid \mathbf{x}_i] = \sigma^2$, so $\boldsymbol{\Omega} = \sigma^2 \mathbf{S}_{XX}$, and the sandwich variance simplifies to:

$$\frac{\sigma^2}{n} \mathbf{S}_{XX}^{-1} \approx \sigma^2 (\mathbf{X}^T\mathbf{X})^{-1}$$

This is the classical variance formula — consistent with the Gauss-Markov result.

**Under heteroskedasticity:** $E[u_i^2 \mid \mathbf{x}_i] = \sigma_i^2 \neq \sigma^2$, the classical formula gives the wrong variance. We need to estimate $\boldsymbol{\Omega}$ consistently.

---

## 5.4 Heteroskedasticity-Robust Standard Errors

**Definition 5.2 (Heteroskedasticity):** Errors are heteroskedastic if $V(u_i \mid \mathbf{x}_i)$ varies across observations.

**Example 5.1:** In a wage regression, it is common for high earners to have greater dispersion in wages than low earners — the variance of $u_i$ may be an increasing function of predicted wages.

### 5.4.1 Consequences of Ignoring Heteroskedasticity

If we use the classical variance formula $\hat{\sigma}^2(\mathbf{X}^T\mathbf{X})^{-1}$ under heteroskedasticity:
- OLS is still **consistent** (consistency does not require spherical errors).
- But standard errors are **wrong**: they may be too large or too small.
- $t$-tests and $F$-tests are **invalid**: rejection rates under the null are not $\alpha$.

### 5.4.2 The Heteroskedasticity-Robust (HC) Estimator

**White (1980)** proposed a consistent estimator of the sandwich variance that does not require spherical errors:

$$\widehat{\text{Var}}_{HC}(\hat{\boldsymbol{\beta}}) = (\mathbf{X}^T\mathbf{X})^{-1} \left(\sum_{i=1}^n \hat{u}_i^2 \mathbf{x}_i \mathbf{x}_i^T\right) (\mathbf{X}^T\mathbf{X})^{-1}$$

This is a sample analogue of the sandwich formula, replacing $E[u_i^2 \mathbf{x}_i \mathbf{x}_i^T]$ with $\frac{1}{n}\sum_{i=1}^n \hat{u}_i^2 \mathbf{x}_i \mathbf{x}_i^T$.

**Why does this work?** By the consistency of OLS, $\hat{u}_i \approx u_i$ for large $n$. So $\hat{u}_i^2 \mathbf{x}_i \mathbf{x}_i^T$ is a consistent estimator of $E[u_i^2 \mathbf{x}_i \mathbf{x}_i^T]$.

### 5.4.3 Small-Sample Corrections (HC1, HC2, HC3)

In small samples, $\hat{u}_i^2$ is a biased downward estimate of $u_i^2$ (because OLS fits the residuals). Several corrections are used in practice:

| Version | Formula | Motivation |
|---|---|---|
| HC0 | $\hat{u}_i^2$ | Original White (1980) estimator |
| HC1 | $\frac{n}{n-k}\hat{u}_i^2$ | Degrees-of-freedom correction |
| HC2 | $\frac{\hat{u}_i^2}{1 - h_{ii}}$ | Corrects for leverage |
| HC3 | $\frac{\hat{u}_i^2}{(1 - h_{ii})^2}$ | Better in very small samples |

where $h_{ii} = [\mathbf{P_X}]_{ii}$ is the $i$-th diagonal of the hat matrix (leverage of observation $i$).

**In practice:** Use HC3 for small samples ($n < 250$), HC1 for larger samples. The `sandwich` and `lmtest` packages in R provide all variants.

> **The Rule of Thumb:** In modern applied econometrics, always report heteroskedasticity-robust standard errors unless you have a strong theoretical reason to believe errors are homoskedastic.

---

## 5.5 Cluster-Robust Standard Errors

### 5.5.1 When Clustering Matters

**Clustering arises when observations are not independent.** Consider:

$$y_{ig} = \mathbf{x}_{ig}^T \boldsymbol{\beta} + u_{ig}$$

where $i$ indexes individuals within group (cluster) $g$. If individuals within the same group share common unobservables (e.g., students in the same school share a teacher quality shock), then $\text{Cov}(u_{ig}, u_{jg}) \neq 0$ for $i \neq j$.

**The variance-covariance structure is block-diagonal:**

$$E[\mathbf{u}\mathbf{u}^T] = \begin{pmatrix} \boldsymbol{\Sigma}_1 & \mathbf{0} & \cdots & \mathbf{0} \\ \mathbf{0} & \boldsymbol{\Sigma}_2 & \cdots & \mathbf{0} \\ \vdots & & \ddots & \vdots \\ \mathbf{0} & \mathbf{0} & \cdots & \boldsymbol{\Sigma}_G \end{pmatrix}$$

where $\boldsymbol{\Sigma}_g = E[\mathbf{u}_g \mathbf{u}_g^T]$ allows arbitrary within-cluster correlation.

### 5.5.2 The Cluster-Robust Sandwich Estimator

**Definition 5.3 (Cluster-Robust SE):**

$$\widehat{\text{Var}}_{CR}(\hat{\boldsymbol{\beta}}) = (\mathbf{X}^T\mathbf{X})^{-1} \left(\sum_{g=1}^G \mathbf{X}_g^T \hat{\mathbf{u}}_g \hat{\mathbf{u}}_g^T \mathbf{X}_g\right) (\mathbf{X}^T\mathbf{X})^{-1}$$

where $\mathbf{X}_g$ and $\hat{\mathbf{u}}_g$ are the design matrix and residuals for cluster $g$.

**Key difference from HC:** HC sums over individual observations; CR sums over clusters. Within each cluster, we allow arbitrary covariance in residuals.

### 5.5.3 Practical Guidance on When to Cluster

Clustering is needed when:

1. **Treatment is at a higher level than outcomes.** E.g., a minimum wage law applies to a state, but outcomes are individual workers. Cluster at the state level.

2. **Panel data with repeated observations.** Each individual appears multiple times; errors are autocorrelated over time. Cluster at the individual level.

3. **Assignment of treatment is clustered.** E.g., a program assigns villages to treatment; outcomes are individual household members. Cluster at the village level.

**Rule of thumb:** Cluster at the level at which treatment varies (or at which observations are correlated).

**Warning — few clusters:** Cluster-robust SEs rely on $G \to \infty$. With few clusters ($G < 20$), they are unreliable. In such cases, use the **wild cluster bootstrap** (see Cameron and Miller, 2015).

**Example 5.2 (Card and Krueger, 1994):** In their study of the effect of a New Jersey minimum wage increase on fast-food employment, Card and Krueger cluster at the restaurant level — each restaurant is surveyed before and after the policy change, so two observations per restaurant are correlated.

---

## 5.6 When to Cluster? Practical Guidance

A common question from students: "Should I cluster?" The answer depends on the data structure, not the size of the coefficient:

| Situation | Cluster? | Level |
|---|---|---|
| Random sample, i.i.d. observations | No | — |
| Survey with multi-stage sampling | Yes | Primary sampling unit |
| Difference-in-differences | Yes | State/region/treatment unit |
| Panel data | Yes | Individual/firm |
| Cross-section with geographic variation | Often | Geographic unit |
| RCT with cluster randomization | Yes | Randomization unit |

**Never** choose whether to cluster based on whether it changes your results. Cluster based on the structure of the data.

---

## 5.7 Empirical Illustration: Wages and Education Revisited

Consider the CPS wage regression:

$$\log(\text{wage}_i) = \beta_1 + \beta_2 \cdot \text{educ}_i + \beta_3 \cdot \text{exp}_i + \beta_4 \cdot \text{exp}_i^2 + u_i$$

**Table 5.1: OLS Estimates with Different Standard Errors**

| | Classical SE | HC1 SE | HC3 SE |
|---|---|---|---|
| Education | 0.0709 (0.0010) | 0.0709 (0.0011) | 0.0709 (0.0011) |
| Experience | 0.0343 (0.0010) | 0.0343 (0.0013) | 0.0343 (0.0013) |
| Exp² | −0.0005 (0.000) | −0.0005 (0.000) | −0.0005 (0.000) |

Standard errors in parentheses.

In this large sample, classical and robust SEs are similar because $n$ is large. The key point: in datasets with clear heteroskedasticity patterns, or with clustering, the differences can be substantial.

---

## Chapter Summary

- Asymptotic theory delivers results about $\hat{\boldsymbol{\beta}}$ under weaker conditions than finite-sample theory.
- OLS is **consistent** under predeterminedness ($E[\mathbf{x}_i u_i] = \mathbf{0}$) — weaker than strict exogeneity.
- The **asymptotic distribution** of $\sqrt{n}(\hat{\boldsymbol{\beta}} - \boldsymbol{\beta})$ is normal with sandwich variance $\mathbf{S}_{XX}^{-1}\boldsymbol{\Omega}\mathbf{S}_{XX}^{-1}$.
- **Heteroskedasticity** means $V(u_i \mid \mathbf{x}_i)$ is not constant. It does not bias OLS but invalidates classical SEs.
- **White (HC) standard errors** provide consistent inference under heteroskedasticity of unknown form.
- **Cluster-robust standard errors** are needed when observations within groups are correlated; they cluster the "meat" of the sandwich at the group level.
- In modern applied work, **always report robust standard errors** unless there is a strong reason to believe errors are spherical.

---

## Key Terms

**Consistency** — $\hat{\boldsymbol{\beta}} \xrightarrow{p} \boldsymbol{\beta}$ as $n \to \infty$.

**Predeterminedness** — $E[\mathbf{x}_i u_i] = \mathbf{0}$; weaker than strict exogeneity.

**Asymptotic normality** — $\sqrt{n}(\hat{\boldsymbol{\beta}} - \boldsymbol{\beta}) \xrightarrow{d} N(\mathbf{0}, \mathbf{V})$ for some variance matrix $\mathbf{V}$.

**Sandwich variance** — $\mathbf{S}_{XX}^{-1}\boldsymbol{\Omega}\mathbf{S}_{XX}^{-1}$; the asymptotic variance of OLS.

**Heteroskedasticity** — non-constant error variance: $V(u_i \mid \mathbf{x}_i) \neq \sigma^2$.

**Heteroskedasticity-robust (HC) SE** — consistent standard errors that allow for heteroskedasticity.

**Cluster-robust SE** — consistent standard errors that allow for within-cluster correlation.

**Wild cluster bootstrap** — a resampling method for inference with few clusters.

---

## Exercises

### Conceptual Questions

**5.1** Explain the difference between **unbiasedness** and **consistency**. Give an example of an estimator that is consistent but biased in small samples.

**5.2** Why does heteroskedasticity not cause OLS to be biased or inconsistent? What does it affect?

**5.3** A researcher runs a difference-in-differences regression using state-level panel data (50 states, 10 years). A colleague says "You have 500 observations, so clustering doesn't matter." Evaluate this claim.

**5.4** What is the "sandwich" structure of the heteroskedasticity-robust variance estimator? Why is it called a sandwich?

**5.5** You are analyzing school data where 30 students are observed in each of 50 schools. Should you cluster by student, school, or not at all? Justify your answer.

### Analytical Questions

**5.6** Prove that under predeterminedness and i.i.d. sampling, OLS is consistent.

**5.7** Suppose $V(u_i \mid x_i) = \sigma^2 x_i^2$. Derive the true variance of OLS in the bivariate regression of $y_i$ on $x_i$. Show it differs from the classical formula $\sigma^2/\text{SST}_x$.

**5.8** Show that when $V(u_i \mid \mathbf{x}_i) = \sigma^2$ (homoskedasticity), the HC0 sandwich estimator is NOT equal to the classical estimator, but converges to the same limit as $n \to \infty$.

**5.9** Consider panel data $y_{it} = \mathbf{x}_{it}^T\boldsymbol{\beta} + \alpha_i + \epsilon_{it}$ where $\alpha_i$ is an individual-specific shock and $\epsilon_{it}$ is i.i.d. If you run OLS pooling all observations without fixed effects, $\hat{\boldsymbol{\beta}}$ is generally biased. But even if you control for fixed effects (making $\hat{\boldsymbol{\beta}}$ consistent), why might you still need to cluster standard errors at the individual level?

### Applied Questions

**5.10** Using the CPS data, estimate the wage regression with (a) classical SEs, (b) HC1 SEs, and (c) HC3 SEs. Report all three and compare. When do they differ?

**5.11** In R, demonstrate via Monte Carlo simulation that the classical $t$-test has the wrong size (rejection rate $\neq 5\%$ under $H_0$) when errors are heteroskedastic, but the HC-robust $t$-test maintains the correct size.

---

## R Lab 5: Robust Standard Errors in Practice

### Setup

```r
library(tidyverse)
library(sandwich)   # for vcovHC
library(lmtest)    # for coeftest
library(AER)

data("CPS1988")
CPS1988 <- CPS1988 %>% mutate(log_wage = log(wage))

model <- lm(log_wage ~ education + experience + I(experience^2), data = CPS1988)
```

### Exercise 5.1: Compare Standard Errors

```r
# Classical SEs
coeftest(model)

# HC0 (White 1980)
coeftest(model, vcov = vcovHC(model, type = "HC0"))

# HC1 (degrees-of-freedom correction)
coeftest(model, vcov = vcovHC(model, type = "HC1"))

# HC3 (best for small samples)
coeftest(model, vcov = vcovHC(model, type = "HC3"))
```

### Exercise 5.2: Detecting Heteroskedasticity

```r
# Residuals vs fitted values plot
df_resid <- data.frame(
  fitted   = fitted(model),
  residuals = residuals(model)
)

ggplot(df_resid, aes(x = fitted, y = residuals)) +
  geom_point(alpha = 0.2, color = "steelblue") +
  geom_hline(yintercept = 0, color = "red") +
  geom_smooth(method = "loess", se = FALSE, color = "darkred") +
  labs(
    title = "Residuals vs. Fitted Values",
    subtitle = "Pattern indicates heteroskedasticity",
    x = "Fitted Values", y = "Residuals"
  ) +
  theme_minimal()

# Breusch-Pagan test for heteroskedasticity
library(lmtest)
bptest(model)
```

### Exercise 5.3: Cluster-Robust Standard Errors

```r
library(sandwich)

# Simulate panel-like clustering by state (using ethnicity as a proxy cluster)
# In real applications, cluster = geographic unit or treatment unit

# Cluster by 'ethnicity' (as illustrative proxy)
vcov_cluster <- vcovCL(model, cluster = ~ CPS1988$ethnicity)
coeftest(model, vcov = vcov_cluster)
```

### Exercise 5.4: Monte Carlo — Size of Classical vs. Robust t-tests under Heteroskedasticity

```r
set.seed(42)
n_sims <- 5000
n      <- 200
reject_classical <- numeric(n_sims)
reject_robust    <- numeric(n_sims)

for (s in 1:n_sims) {
  x <- rnorm(n)
  u <- rnorm(n, sd = abs(x))   # heteroskedastic: V(u|x) = x^2
  y <- 1 + 0 * x + u            # H0: beta = 0 is TRUE

  fit <- lm(y ~ x)
  
  # Classical t-stat
  t_classic <- summary(fit)$coefficients["x", "t value"]
  reject_classical[s] <- abs(t_classic) > 1.96
  
  # Robust t-stat
  t_robust <- coeftest(fit, vcov = vcovHC(fit, "HC1"))["x", "t value"]
  reject_robust[s] <- abs(t_robust) > 1.96
}

cat("Classical test rejection rate:", round(mean(reject_classical), 3),
    "(should be ~0.05)\n")
cat("Robust test rejection rate:   ", round(mean(reject_robust), 3),
    "(should be ~0.05)\n")
```

**Expected finding:** The classical test rejects too often (size > 5%) under heteroskedasticity; the robust test maintains approximately the correct size.

---

*End of Chapter 5*

---

**References**

White, H. (1980). A heteroskedasticity-consistent covariance matrix estimator and a direct test for heteroskedasticity. *Econometrica*, 48(4), 817–838.

Davidson, R., and MacKinnon, J. G. (2004). *Econometric Theory and Methods*. Chapter 3.

Angrist, J. D., and Pischke, J. (2009). *Mostly Harmless Econometrics*. Chapter 8.

Cameron, A. C., and Miller, D. L. (2015). A practitioner's guide to cluster-robust inference. *Journal of Human Resources*, 50(2), 317–372.

Cunningham, S. (2021). *Causal Inference: The Mixtape*. Chapter on regression.
