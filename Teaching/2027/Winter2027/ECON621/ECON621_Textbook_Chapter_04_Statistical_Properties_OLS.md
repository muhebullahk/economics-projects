# Chapter 4: Statistical Properties of OLS — Finite Sample Theory

---

## Chapter Overview

Chapter 3 established the *algebraic* properties of OLS — results that hold in any sample, without any distributional assumptions. This chapter turns to the *statistical* properties of OLS: is $\hat{\boldsymbol{\beta}}$ close to the true parameter $\boldsymbol{\beta}$? How precise is it? How do we conduct valid inference (hypothesis tests and confidence intervals)?

We answer these questions first in the **finite-sample** framework, which requires stronger assumptions but gives exact distributional results. We state the classical **Gauss-Markov assumptions**, prove **unbiasedness** and the **Gauss-Markov Theorem** (OLS is BLUE), and derive inference procedures under normality. Chapter 5 relaxes the normality and homoskedasticity assumptions using large-sample (asymptotic) theory.

---

## Learning Objectives

After completing this chapter, students will be able to:

1. State the **classical (Gauss-Markov) assumptions** for the linear regression model.
2. Prove that OLS is **unbiased** under strict exogeneity.
3. Derive the **variance-covariance matrix** of the OLS estimator.
4. State and prove the **Gauss-Markov Theorem**.
5. Derive the **$t$-statistic** and construct **confidence intervals** for individual coefficients.
6. Construct and interpret the **$F$-statistic** for joint hypothesis tests.
7. Explain the **estimated variance** of OLS and why $\hat{\sigma}^2 = SSR/(n-k)$.
8. Discuss the sources of estimator variance (sample size, multicollinearity, error variance).

---

## 4.1 Setting Up the Framework: Classical Assumptions

To derive statistical properties of OLS, we need assumptions about the data-generating process (DGP). The **Classical Linear Regression Model (CLRM)** rests on five assumptions.

**Assumption 4.1 (Linearity):** The population model is correctly specified as:
$$\mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \mathbf{u}$$
where $\boldsymbol{\beta}$ is the true (unknown) parameter vector.

**Assumption 4.2 (Full Rank):** The design matrix $\mathbf{X}$ has full column rank $k$ (no perfect multicollinearity).

**Assumption 4.3 (Strict Exogeneity):**
$$E[\mathbf{u} \mid \mathbf{X}] = \mathbf{0}$$
This says that the conditional expectation of the error vector, given the entire design matrix, is zero. This implies $E[u_i \mid \mathbf{x}_1, \mathbf{x}_2, \ldots, \mathbf{x}_n] = 0$: the error for observation $i$ is mean-zero conditional on *all* observations' covariates.

**Assumption 4.4 (Spherical Errors / Homoskedasticity and No Serial Correlation):**
$$E[\mathbf{u}\mathbf{u}^T \mid \mathbf{X}] = \sigma^2 \mathbf{I}_n$$
This combines two conditions:
- *Homoskedasticity:* $E[u_i^2 \mid \mathbf{X}] = \sigma^2$ for all $i$ (constant variance).
- *No serial correlation:* $E[u_i u_j \mid \mathbf{X}] = 0$ for all $i \neq j$ (uncorrelated errors).

**Assumption 4.5 (Normality):** The errors are jointly normally distributed:
$$\mathbf{u} \mid \mathbf{X} \sim N(\mathbf{0}, \sigma^2 \mathbf{I}_n)$$

> **Note on Assumptions:** Assumptions 4.1–4.4 are the **Gauss-Markov assumptions**. Assumption 4.5 (normality) is additional and is needed only for *exact* finite-sample inference. As we show in Chapter 5, Assumption 4.5 can be dropped in large samples.

### 4.1.1 Discussion of Strict Exogeneity

Assumption 4.3 is the critical identifying assumption. It requires that the error $u_i$ is uncorrelated with *all* regressors in *all* observations. This is stronger than merely requiring $E[u_i \mid \mathbf{x}_i] = 0$ (conditional mean zero for observation $i$'s own regressors).

**When strict exogeneity fails:**
- **Omitted variable bias:** An important determinant of $y$ that is correlated with $\mathbf{x}_i$ is left out of the model.
- **Reverse causality:** $y$ causes $\mathbf{x}$ as well as vice versa.
- **Measurement error:** $\mathbf{x}_i$ is measured with error that is correlated with the true regressor.
- **Panel data with lagged dependent variables:** $E[u_{it} \mid x_{i,t-1}]$ may be non-zero even if $E[u_{it} \mid x_{it}] = 0$.

When Assumption 4.3 fails, OLS is **biased** and potentially **inconsistent**. Addressing this is the focus of Chapters 6–13.

---

## 4.2 Unbiasedness of OLS

**Theorem 4.1 (Unbiasedness of OLS):** Under Assumptions 4.1–4.3, the OLS estimator is **unbiased**: $E[\hat{\boldsymbol{\beta}} \mid \mathbf{X}] = \boldsymbol{\beta}$.

**Proof:**

$$\hat{\boldsymbol{\beta}} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{y} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T(\mathbf{X}\boldsymbol{\beta} + \mathbf{u}) = \boldsymbol{\beta} + (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{u}$$

Taking the conditional expectation given $\mathbf{X}$:

$$E[\hat{\boldsymbol{\beta}} \mid \mathbf{X}] = \boldsymbol{\beta} + (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T \underbrace{E[\mathbf{u} \mid \mathbf{X}]}_{= \mathbf{0}} = \boldsymbol{\beta}$$

By the **Law of Iterated Expectations**: $E[\hat{\boldsymbol{\beta}}] = E[E[\hat{\boldsymbol{\beta}} \mid \mathbf{X}]] = E[\boldsymbol{\beta}] = \boldsymbol{\beta}$. $\square$

**Interpretation:** On average (over repeated samples), the OLS estimator hits the true parameter. In any given sample, $\hat{\boldsymbol{\beta}} \neq \boldsymbol{\beta}$ due to sampling variation, but there is no systematic error.

### 4.2.1 Importance of Strict Exogeneity

The proof relies critically on Assumption 4.3. If $E[\mathbf{u} \mid \mathbf{X}] \neq \mathbf{0}$, then:

$$E[\hat{\boldsymbol{\beta}} \mid \mathbf{X}] = \boldsymbol{\beta} + (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T E[\mathbf{u} \mid \mathbf{X}] \neq \boldsymbol{\beta}$$

The OLS estimator is biased. The bias is:

$$\text{Bias}(\hat{\boldsymbol{\beta}}) = E[\hat{\boldsymbol{\beta}}] - \boldsymbol{\beta} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T E[\mathbf{u}]$$

---

## 4.3 The Variance-Covariance Matrix of OLS

**Theorem 4.2 (Variance of OLS under Spherical Errors):** Under Assumptions 4.1–4.4:

$$\text{Var}(\hat{\boldsymbol{\beta}} \mid \mathbf{X}) = \sigma^2 (\mathbf{X}^T\mathbf{X})^{-1}$$

**Proof:** From the proof of Theorem 4.1: $\hat{\boldsymbol{\beta}} - \boldsymbol{\beta} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{u}$.

$$\text{Var}(\hat{\boldsymbol{\beta}} \mid \mathbf{X}) = E\left[(\hat{\boldsymbol{\beta}} - \boldsymbol{\beta})(\hat{\boldsymbol{\beta}} - \boldsymbol{\beta})^T \mid \mathbf{X}\right]$$

$$= (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T \underbrace{E[\mathbf{u}\mathbf{u}^T \mid \mathbf{X}]}_{= \sigma^2 \mathbf{I}_n} \mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1}$$

$$= \sigma^2 (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1} = \sigma^2 (\mathbf{X}^T\mathbf{X})^{-1} \quad \square$$

### 4.3.1 The Variance of Individual Coefficients

The variance of the $j$-th coefficient $\hat{\beta}_j$ is the $j$-th diagonal element of $\sigma^2(\mathbf{X}^T\mathbf{X})^{-1}$:

$$\text{Var}(\hat{\beta}_j \mid \mathbf{X}) = \sigma^2 [(\mathbf{X}^T\mathbf{X})^{-1}]_{jj}$$

Using the FWL theorem, one can show:

$$\text{Var}(\hat{\beta}_j \mid \mathbf{X}) = \frac{\sigma^2}{\text{SST}_j (1 - R^2_j)}$$

where $\text{SST}_j = \sum_{i=1}^n (x_{ij} - \bar{x}_j)^2$ is the total variation in $x_{ij}$, and $R^2_j$ is the $R^2$ from regressing $x_{ij}$ on all other regressors.

**Three sources of estimator variance:**

| Factor | Effect on $\text{Var}(\hat{\beta}_j)$ | Intuition |
|---|---|---|
| Larger $\sigma^2$ (more noise) | Increases | More noise → harder to estimate signal |
| Larger $\text{SST}_j$ (more variation in $x_j$) | Decreases | More variation → more information |
| Larger $R^2_j$ (more multicollinearity) | Increases | Collinearity → $x_j$ explains little net information |

### 4.3.2 Estimating $\sigma^2$

The population error variance $\sigma^2 = E[u_i^2]$ is unknown. We estimate it using the OLS residuals:

$$\hat{\sigma}^2 = \frac{SSR}{n - k} = \frac{\hat{\mathbf{u}}^T\hat{\mathbf{u}}}{n - k}$$

This is an **unbiased estimator** of $\sigma^2$ under Assumptions 4.1–4.4.

**Why divide by $n - k$ instead of $n$?**

$$E[SSR \mid \mathbf{X}] = E[\hat{\mathbf{u}}^T\hat{\mathbf{u}} \mid \mathbf{X}] = E[\mathbf{u}^T\mathbf{M_X}\mathbf{u} \mid \mathbf{X}]$$

$$= \text{tr}(\mathbf{M_X} E[\mathbf{u}\mathbf{u}^T \mid \mathbf{X}]) = \sigma^2 \text{tr}(\mathbf{M_X}) = \sigma^2 (n - k)$$

Therefore $E[\hat{\sigma}^2] = E[SSR/(n-k)] = \sigma^2$. $\square$

The degrees of freedom correction $n - k$ accounts for the fact that OLS "uses up" $k$ degrees of freedom to estimate $k$ parameters. With $k$ parameters perfectly fitting $k$ observations, there are no degrees of freedom left for estimation.

---

## 4.4 The Gauss-Markov Theorem: OLS is BLUE

**Theorem 4.3 (Gauss-Markov Theorem):** Under Assumptions 4.1–4.4, the OLS estimator $\hat{\boldsymbol{\beta}}$ is the **Best Linear Unbiased Estimator (BLUE)** of $\boldsymbol{\beta}$. That is, among all linear unbiased estimators $\tilde{\boldsymbol{\beta}} = \mathbf{C}\mathbf{y}$ (where $\mathbf{C}$ is any non-random matrix with $E[\tilde{\boldsymbol{\beta}}] = \boldsymbol{\beta}$), OLS has the smallest variance matrix in the sense that:

$$\text{Var}(\tilde{\boldsymbol{\beta}} \mid \mathbf{X}) - \text{Var}(\hat{\boldsymbol{\beta}} \mid \mathbf{X}) = \text{Var}(\tilde{\boldsymbol{\beta}} \mid \mathbf{X}) - \sigma^2 (\mathbf{X}^T\mathbf{X})^{-1} \geq 0 \quad \text{(positive semi-definite)}$$

**Proof:** Let $\tilde{\boldsymbol{\beta}} = \mathbf{C}\mathbf{y}$ be any linear unbiased estimator. For unbiasedness: $E[\tilde{\boldsymbol{\beta}} \mid \mathbf{X}] = \mathbf{C}\mathbf{X}\boldsymbol{\beta} = \boldsymbol{\beta}$ for all $\boldsymbol{\beta}$, which requires $\mathbf{C}\mathbf{X} = \mathbf{I}_k$.

Write $\mathbf{C} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T + \mathbf{D}$ where $\mathbf{D} = \mathbf{C} - (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T$. Unbiasedness requires $\mathbf{D}\mathbf{X} = \mathbf{0}$.

Then:

$$\text{Var}(\tilde{\boldsymbol{\beta}} \mid \mathbf{X}) = \mathbf{C} \cdot \sigma^2 \mathbf{I}_n \cdot \mathbf{C}^T = \sigma^2 \mathbf{C}\mathbf{C}^T$$

$$= \sigma^2 \left[(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1} + \mathbf{D}\mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1} + (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{D}^T + \mathbf{D}\mathbf{D}^T\right]$$

Since $\mathbf{D}\mathbf{X} = \mathbf{0}$, the cross terms vanish:

$$\text{Var}(\tilde{\boldsymbol{\beta}} \mid \mathbf{X}) = \sigma^2 (\mathbf{X}^T\mathbf{X})^{-1} + \sigma^2 \mathbf{D}\mathbf{D}^T = \text{Var}(\hat{\boldsymbol{\beta}} \mid \mathbf{X}) + \sigma^2 \mathbf{D}\mathbf{D}^T$$

Since $\sigma^2 \mathbf{D}\mathbf{D}^T \geq 0$ (positive semi-definite), we have $\text{Var}(\tilde{\boldsymbol{\beta}}) \geq \text{Var}(\hat{\boldsymbol{\beta}})$. $\square$

> **Interpreting Gauss-Markov:** The theorem says OLS is the most efficient estimator among all linear unbiased estimators. No other linear combination of the data produces unbiased coefficient estimates with smaller standard errors. This is a strong optimality result within the class of linear estimators.

**Important caveats:**
1. Gauss-Markov only compares OLS to *linear* estimators. Non-linear estimators (e.g., maximum likelihood under non-normal errors) may be more efficient.
2. The theorem requires spherical errors (Assumption 4.4). Under heteroskedasticity, **Feasible Generalized Least Squares (FGLS)** beats OLS in efficiency.
3. The theorem says nothing about whether OLS is *consistent* (consistent requires Assumption 4.3 to be weakened, as we show in Chapter 5).

---

## 4.5 Inference Under Normality

Under all five Gauss-Markov assumptions including normality (Assumption 4.5):

$$\hat{\boldsymbol{\beta}} \mid \mathbf{X} \sim N\left(\boldsymbol{\beta}, \sigma^2(\mathbf{X}^T\mathbf{X})^{-1}\right)$$

This follows immediately from the fact that $\hat{\boldsymbol{\beta}} = \boldsymbol{\beta} + (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{u}$ is a linear transformation of $\mathbf{u}$, which is normal.

For any individual coefficient $\hat{\beta}_j$:

$$\hat{\beta}_j \mid \mathbf{X} \sim N\left(\beta_j, \sigma^2 [(\mathbf{X}^T\mathbf{X})^{-1}]_{jj}\right)$$

### 4.5.1 The $t$-Statistic

Since $\sigma^2$ is unknown, we replace it with $\hat{\sigma}^2$. The resulting statistic follows a $t$-distribution:

$$t_j = \frac{\hat{\beta}_j - \beta_j^0}{\widehat{SE}(\hat{\beta}_j)} \sim t_{n-k}$$

where $\beta_j^0$ is the value under the null hypothesis, and $\widehat{SE}(\hat{\beta}_j) = \hat{\sigma}\sqrt{[(\mathbf{X}^T\mathbf{X})^{-1}]_{jj}}$ is the estimated standard error.

**Proof:** We have $(\hat{\beta}_j - \beta_j) / (\sigma \sqrt{[(\mathbf{X}^T\mathbf{X})^{-1}]_{jj}}) \sim N(0,1)$ and $(n-k)\hat{\sigma}^2/\sigma^2 \sim \chi^2_{n-k}$ (under normality), and these two are independent. The ratio of a standard normal to the square root of an independent chi-squared divided by its degrees of freedom has a $t$-distribution. $\square$

**Hypothesis testing:** To test $H_0: \beta_j = 0$ against $H_1: \beta_j \neq 0$:

1. Compute $t_j = \hat{\beta}_j / \widehat{SE}(\hat{\beta}_j)$.
2. Compare to $t_{n-k, \alpha/2}$ (critical value from $t$-distribution with $n-k$ degrees of freedom).
3. Reject $H_0$ if $|t_j| > t_{n-k, \alpha/2}$.
4. The $p$-value is $P(|T| > |t_j|)$ where $T \sim t_{n-k}$.

For large $n$, $t_{n-k}$ is well approximated by $N(0,1)$, and the "rule of thumb" for significance at the 5% level is $|t| > 1.96$.

### 4.5.2 Confidence Intervals

A $(1-\alpha)$ confidence interval for $\beta_j$ is:

$$\hat{\beta}_j \pm t_{n-k, \alpha/2} \cdot \widehat{SE}(\hat{\beta}_j)$$

**Interpretation:** In repeated sampling, $(1-\alpha)$% of such intervals will contain the true $\beta_j$. **It is not true** that the probability the true $\beta_j$ falls in a specific realized interval is $(1-\alpha)$% — the true $\beta_j$ is fixed; the interval is random.

### 4.5.3 Practical Significance vs. Statistical Significance

A statistically significant coefficient is not necessarily economically significant. A study with $n = 100{,}000$ observations can detect very small effects with high precision. Conversely, a study with $n = 50$ may fail to reject the null even for economically large effects.

**Good practice:** Report both the coefficient estimate (magnitude of economic effect) and the standard error (precision), not just the $t$-statistic.

---

## 4.6 Joint Hypothesis Tests: The $F$-Statistic

Often we want to test joint hypotheses about multiple coefficients. For example:
- $H_0: \beta_2 = \beta_3 = 0$ (neither experience nor experience² matters)
- $H_0: \beta_2 = \beta_3$ (two effects are equal)

**General setup:** Consider the null hypothesis $H_0: \mathbf{R}\boldsymbol{\beta} = \mathbf{r}$, where $\mathbf{R}$ is a $q \times k$ matrix of linear restrictions (rank $q$) and $\mathbf{r}$ is a $q \times 1$ vector.

**Definition 4.1 (F-Statistic):**

$$F = \frac{(\mathbf{R}\hat{\boldsymbol{\beta}} - \mathbf{r})^T \left[\mathbf{R}(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{R}^T\right]^{-1} (\mathbf{R}\hat{\boldsymbol{\beta}} - \mathbf{r})}{q \hat{\sigma}^2}$$

Under $H_0$ and Assumptions 4.1–4.5: $F \sim F_{q, n-k}$.

**Equivalent Formulation via Restricted and Unrestricted Regressions:**

$$F = \frac{(SSR_R - SSR_U)/q}{SSR_U/(n-k)}$$

where $SSR_R$ is from the **restricted regression** (imposing $H_0$) and $SSR_U$ is from the **unrestricted regression**.

**Intuition:** If the restrictions are true, imposing them should not increase the SSR by much. If the $F$-statistic is large, the restrictions are inconsistent with the data.

**Special case:** When $q = 1$ and $H_0: \beta_j = 0$, $F = t_j^2$ (the $F$-statistic is the square of the $t$-statistic).

**The overall $F$-test:** With $\mathbf{R} = [\mathbf{0} \mid \mathbf{I}_{k-1}]$ and $\mathbf{r} = \mathbf{0}_{k-1}$ (testing all slope coefficients jointly), the $F$-statistic tests whether *any* regressor matters:

$$F = \frac{R^2/(k-1)}{(1-R^2)/(n-k)}$$

---

## Chapter Summary

- Under Assumptions 4.1–4.3 (including strict exogeneity), OLS is **unbiased**.
- Under Assumptions 4.1–4.4 (adding spherical errors), the variance of OLS is $\sigma^2(\mathbf{X}^T\mathbf{X})^{-1}$, and OLS is the **Best Linear Unbiased Estimator (BLUE)** — the **Gauss-Markov Theorem**.
- The variance of $\hat{\beta}_j$ depends inversely on the variation in $x_j$ and positively on the error variance and multicollinearity ($R^2_j$).
- $\hat{\sigma}^2 = SSR/(n-k)$ is an unbiased estimator of $\sigma^2$; the degrees of freedom are $n - k$.
- Under normality (Assumption 4.5), $\hat{\boldsymbol{\beta}}$ is normally distributed, enabling exact $t$-tests and $F$-tests.
- The $t$-statistic tests single hypotheses; the $F$-statistic tests joint hypotheses.

---

## Key Terms

**Strict exogeneity** — $E[\mathbf{u} \mid \mathbf{X}] = \mathbf{0}$.

**Homoskedasticity** — $E[u_i^2 \mid \mathbf{X}] = \sigma^2$ (constant error variance).

**Spherical errors** — $E[\mathbf{u}\mathbf{u}^T \mid \mathbf{X}] = \sigma^2 \mathbf{I}_n$.

**Unbiasedness** — $E[\hat{\boldsymbol{\beta}}] = \boldsymbol{\beta}$.

**Variance-covariance matrix of OLS** — $\text{Var}(\hat{\boldsymbol{\beta}} \mid \mathbf{X}) = \sigma^2(\mathbf{X}^T\mathbf{X})^{-1}$.

**Gauss-Markov Theorem** — OLS is BLUE (Best Linear Unbiased Estimator) under Assumptions 4.1–4.4.

**BLUE** — Best (minimum variance) Linear Unbiased Estimator.

**Degrees of freedom** — $n - k$; the number of observations minus the number of estimated parameters.

**$t$-statistic** — $t_j = \hat{\beta}_j / \widehat{SE}(\hat{\beta}_j) \sim t_{n-k}$ under $H_0: \beta_j = 0$.

**$F$-statistic** — statistic for joint hypothesis tests; $F \sim F_{q, n-k}$ under $H_0$.

---

## Exercises

### Conceptual Questions

**4.1** Explain the difference between **unbiasedness** and **consistency**. Can an estimator be unbiased but inconsistent? Consistent but biased?

**4.2** Assumption 4.3 (strict exogeneity) requires $E[u_i \mid \mathbf{x}_1, \ldots, \mathbf{x}_n] = 0$, not just $E[u_i \mid \mathbf{x}_i] = 0$. Give an example where the weaker condition holds but strict exogeneity fails.

**4.3** Suppose we run OLS on data where $V(u_i) = \sigma^2 x_i^2$ (variance increases with $x_i$). The Gauss-Markov assumptions are violated. What specific assumption fails? Is OLS still unbiased? Is it still BLUE?

**4.4** Explain the degrees of freedom correction in $\hat{\sigma}^2 = SSR/(n-k)$. Why is dividing by $n$ instead of $n - k$ problematic?

**4.5** A researcher has a sample of $n = 1000$ and runs a regression with 3 regressors. She obtains $\hat{\beta}_2 = 0.5$ with $\widehat{SE}(\hat{\beta}_2) = 0.4$ ($t$-stat = 1.25). She concludes "the effect of $x_2$ is economically large but statistically insignificant." Comment on this interpretation.

### Analytical Questions

**4.6** Under Assumptions 4.1–4.5, derive the distribution of $\hat{\boldsymbol{\beta}} \mid \mathbf{X}$.

**4.7** Prove that $E[SSR \mid \mathbf{X}] = (n-k)\sigma^2$, showing that $\hat{\sigma}^2 = SSR/(n-k)$ is unbiased.

**4.8** Let $c$ be a known $k \times 1$ vector. Find the variance of the linear combination $\mathbf{c}^T \hat{\boldsymbol{\beta}}$ under Assumptions 4.1–4.4. (This is useful for constructing confidence intervals for marginal effects or predictions.)

**4.9** Derive the $F$-statistic for the overall test of significance ($H_0$: all slope coefficients = 0) and show that it equals $\frac{R^2/(k-1)}{(1-R^2)/(n-k)}$.

**4.10** Suppose you add an irrelevant variable $z$ (with $\text{Cov}(z, u) = 0$ in the population) to a correctly specified regression. What happens to: (a) unbiasedness of existing coefficient estimates? (b) the variances of existing coefficient estimates? (c) $R^2$? (d) adjusted $R^2$?

### Applied Questions

**4.11** Using the CPS data from previous labs, run a regression of log wages on education, experience, and experience$^2$. 

(a) Test $H_0: \beta_{\text{edu}} = 0$ at the 5% level. Report the $t$-statistic, $p$-value, and conclusion.  
(b) Construct a 95% confidence interval for $\beta_{\text{edu}}$.  
(c) Test the joint hypothesis $H_0: \beta_{\text{exp}} = \beta_{\text{exp}^2} = 0$.  
(d) What is the estimated peak of the experience-earnings profile?

**4.12** Conduct a Monte Carlo study to verify unbiasedness of OLS:
- Generate data: $y_i = 2 + 3x_i + u_i$, $x_i \sim N(0,1)$, $u_i \sim N(0,1)$, $n = 50$.
- Repeat 1000 times; in each repetition, compute $\hat{\beta}_1$ and $\hat{\beta}_2$.
- Report the mean of $\hat{\beta}_1$ and $\hat{\beta}_2$ across replications.
- Show that the sampling distributions are centred on the true values.

---

## R Lab 4: Statistical Properties and Inference

### Objectives
- Verify unbiasedness via Monte Carlo simulation
- Compute standard errors and construct confidence intervals
- Test hypotheses using t and F statistics
- Explore the effects of multicollinearity

### Exercise 4.1: Verifying Unbiasedness via Monte Carlo

```r
set.seed(42)
n_sims <- 2000
n      <- 100
beta_true <- c(2, 3, -1)   # intercept, beta_1, beta_2

# Storage
beta_hat_store <- matrix(NA, nrow = n_sims, ncol = 3)

for (s in 1:n_sims) {
  x1 <- rnorm(n)
  x2 <- rnorm(n)
  u  <- rnorm(n)
  y  <- beta_true[1] + beta_true[2] * x1 + beta_true[3] * x2 + u
  
  fit <- lm(y ~ x1 + x2)
  beta_hat_store[s, ] <- coef(fit)
}

# Are OLS estimates centred on true values?
colMeans(beta_hat_store)   # should be close to (2, 3, -1)
apply(beta_hat_store, 2, sd)  # sampling standard deviations

# Plot sampling distribution of beta_1
ggplot(data.frame(beta1 = beta_hat_store[, 2]), aes(x = beta1)) +
  geom_histogram(aes(y = ..density..), bins = 40, fill = "steelblue", alpha = 0.7) +
  geom_vline(xintercept = beta_true[2], color = "red", linewidth = 1) +
  stat_function(fun = dnorm,
                args = list(mean = beta_true[2], sd = sd(beta_hat_store[, 2])),
                color = "darkred", linewidth = 1) +
  labs(title = "Sampling Distribution of OLS Estimator",
       subtitle = paste0("True beta_1 = ", beta_true[2], " (red line); n_sims = ", n_sims),
       x = "Estimated beta_1", y = "Density") +
  theme_minimal()
```

### Exercise 4.2: Inference in R

```r
library(AER)
data("CPS1988")
CPS1988 <- CPS1988 %>% mutate(log_wage = log(wage))

model <- lm(log_wage ~ education + experience + I(experience^2), data = CPS1988)
summary(model)

# Manual confidence interval
alpha <- 0.05
n <- nrow(CPS1988)
k <- length(coef(model))
t_crit <- qt(1 - alpha/2, df = n - k)

coef_table <- data.frame(
  Estimate = coef(model),
  SE = sqrt(diag(vcov(model)))
) %>%
  mutate(
    t_stat  = Estimate / SE,
    CI_lower = Estimate - t_crit * SE,
    CI_upper = Estimate + t_crit * SE,
    p_value  = 2 * pt(-abs(t_stat), df = n - k)
  )
print(round(coef_table, 4))
```

### Exercise 4.3: F-Test for Joint Significance

```r
# Test H0: beta_experience = beta_experience^2 = 0
# Method 1: Built-in F-test via anova()
model_restricted <- lm(log_wage ~ education, data = CPS1988)
model_unrestricted <- model
anova(model_restricted, model_unrestricted)

# Method 2: Manual F-statistic
SSR_R <- sum(residuals(model_restricted)^2)
SSR_U <- sum(residuals(model_unrestricted)^2)
q <- 2   # number of restrictions
F_stat <- ((SSR_R - SSR_U) / q) / (SSR_U / (n - k))
p_val  <- pf(F_stat, df1 = q, df2 = n - k, lower.tail = FALSE)
cat("F-statistic:", round(F_stat, 3), "\n")
cat("p-value:", round(p_val, 4), "\n")
```

### Exercise 4.4: Effect of Multicollinearity

```r
# Simulate data with varying levels of correlation between x1 and x2
set.seed(42)
n <- 200
beta_true <- c(2, 3, -1)

results <- map_dfr(c(0, 0.5, 0.8, 0.95, 0.99), function(rho) {
  sims <- replicate(1000, {
    SIGMA <- matrix(c(1, rho, rho, 1), 2, 2)
    X_sim <- MASS::mvrnorm(n, mu = c(0, 0), Sigma = SIGMA)
    u_sim <- rnorm(n)
    y_sim <- beta_true[1] + beta_true[2] * X_sim[,1] + beta_true[3] * X_sim[,2] + u_sim
    coef(lm(y_sim ~ X_sim))[2]  # coefficient on x1
  })
  data.frame(rho = rho, se_beta1 = sd(sims))
})

print(results)

ggplot(results, aes(x = rho, y = se_beta1)) +
  geom_line(color = "steelblue", linewidth = 1.2) +
  geom_point(size = 3, color = "steelblue") +
  labs(
    title = "Effect of Multicollinearity on Standard Errors",
    subtitle = "As correlation between x1 and x2 increases, SE of beta_1 explodes",
    x = "Correlation between x1 and x2",
    y = "Standard Deviation of OLS Estimator (Monte Carlo)"
  ) +
  theme_minimal()
```

---

*End of Chapter 4*

---

**References**

Davidson, R., and MacKinnon, J. G. (2004). *Econometric Theory and Methods*. Oxford University Press. Chapter 3.

Wooldridge, J. M. (2019). *Introductory Econometrics* (7th ed.). Cengage. Chapters 4–5.

Angrist, J. D., and Pischke, J. (2009). *Mostly Harmless Econometrics*. Princeton University Press. Chapter 3.
