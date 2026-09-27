# Chapter 3: Ordinary Least Squares — Algebra and Geometry

---

## Chapter Overview

This chapter develops the OLS estimator from the ground up. We begin with the multiple regression model written in matrix notation, derive the OLS estimator through two routes (method-of-moments and minimization), and then provide a geometric interpretation using linear algebra. This geometric perspective is not merely elegant — it reveals deep structural properties of OLS that are impossible to see from the algebraic derivation alone. We end with the Frisch-Waugh-Lovell insight, goodness-of-fit measures, and invariance properties of OLS.

Throughout this chapter, we work at the **sample** level: we have $n$ observations and we are fitting an estimator to data, not analyzing a population parameter.

---

## Learning Objectives

After completing this chapter, students will be able to:

1. Write the multiple regression model in **matrix notation**.
2. Derive the **OLS estimator** using the method-of-moments and the least-squares criterion.
3. State the conditions under which $(\mathbf{X}^T\mathbf{X})$ is invertible (full rank condition).
4. Interpret OLS geometrically as an **orthogonal projection** onto the column space of $\mathbf{X}$.
5. Define the **projection matrices** $\mathbf{P_X}$ and $\mathbf{M_X}$ and state their key properties.
6. State and apply the **Pythagorean decomposition** of sum of squares.
7. Compute and interpret **$R^2$** (centered and uncentered).
8. State and apply the **Frisch-Waugh-Lovell (FWL) Theorem**.
9. Discuss how OLS coefficients change with linear transformations of regressors.

---

## 3.1 The Multiple Regression Model

We observe $n$ units (individuals, firms, countries), each described by:
- an **outcome variable** $y_i \in \mathbb{R}$
- a $k \times 1$ vector of **regressors** (including a constant in the first position): $\mathbf{x}_i = (1, x_{i2}, \ldots, x_{ik})^T$

The multiple regression equation for unit $i$ is:

$$y_i = \beta_1 + \beta_2 x_{i2} + \cdots + \beta_k x_{ik} + u_i = \mathbf{x}_i^T \boldsymbol{\beta} + u_i$$

where $\boldsymbol{\beta} = (\beta_1, \beta_2, \ldots, \beta_k)^T$ is the $k \times 1$ vector of **coefficients** and $u_i$ is the **error term**.

### 3.1.1 Matrix Notation

Stack all $n$ observations:

$$\underset{n \times 1}{\mathbf{y}} = \underset{n \times k}{\mathbf{X}} \underset{k \times 1}{\boldsymbol{\beta}} + \underset{n \times 1}{\mathbf{u}}$$

where:

$$\mathbf{y} = \begin{pmatrix} y_1 \\ y_2 \\ \vdots \\ y_n \end{pmatrix}, \quad
\mathbf{X} = \begin{pmatrix} \mathbf{x}_1^T \\ \mathbf{x}_2^T \\ \vdots \\ \mathbf{x}_n^T \end{pmatrix} = \begin{pmatrix} 1 & x_{12} & \cdots & x_{1k} \\ 1 & x_{22} & \cdots & x_{2k} \\ \vdots & \vdots & \ddots & \vdots \\ 1 & x_{n2} & \cdots & x_{nk} \end{pmatrix}, \quad
\boldsymbol{\beta} = \begin{pmatrix} \beta_1 \\ \beta_2 \\ \vdots \\ \beta_k \end{pmatrix}, \quad
\mathbf{u} = \begin{pmatrix} u_1 \\ u_2 \\ \vdots \\ u_n \end{pmatrix}$$

The matrix $\mathbf{X}$ is called the **design matrix**. Each row is an observation; each column is a regressor.

> **Convention:** We use bold lowercase letters for vectors ($\mathbf{y}$, $\mathbf{u}$) and bold uppercase letters for matrices ($\mathbf{X}$, $\mathbf{P}$, $\mathbf{M}$). Scalars are unbolded.

**Example 3.1 (Wage Regression):** In a regression of log wage on years of education and years of experience:

$$\log(\text{wage}_i) = \beta_1 + \beta_2 \cdot \text{educ}_i + \beta_3 \cdot \text{exp}_i + u_i$$

Here $n$ is the number of workers, $k = 3$, and the design matrix $\mathbf{X}$ has three columns: a column of ones, a column of education values, and a column of experience values.

---

## 3.2 The OLS Estimator: Derivation via Method of Moments

The **Method of Moments (MM)** estimator is derived by finding $\hat{\boldsymbol{\beta}}$ such that the **sample moment conditions** are satisfied.

From the population orthogonality condition $E[\mathbf{x}_i u_i] = \mathbf{0}$, the sample analogue is:

$$\frac{1}{n} \sum_{i=1}^n \mathbf{x}_i (y_i - \mathbf{x}_i^T \hat{\boldsymbol{\beta}}) = \mathbf{0}$$

In matrix notation:

$$\mathbf{X}^T (\mathbf{y} - \mathbf{X}\hat{\boldsymbol{\beta}}) = \mathbf{0}$$

These are the **$k$ Normal Equations** (one for each regressor):

$$\mathbf{X}^T \mathbf{X} \hat{\boldsymbol{\beta}} = \mathbf{X}^T \mathbf{y}$$

If $\mathbf{X}^T \mathbf{X}$ is **invertible** (i.e., $\mathbf{X}$ has full column rank $k$), we can solve:

$$\boxed{\hat{\boldsymbol{\beta}}^{OLS} = (\mathbf{X}^T \mathbf{X})^{-1} \mathbf{X}^T \mathbf{y}}$$

This is the **OLS estimator** — the central formula of classical econometrics.

### 3.2.1 The Full Rank Condition

The matrix $\mathbf{X}$ has **full column rank** (rank $k$) if and only if no column of $\mathbf{X}$ can be written as a linear combination of the other columns. Violations include:

1. **Perfect multicollinearity:** two regressors are proportional or one is an exact linear combination of others.
2. **Dummy variable trap:** including a dummy for every category while also including an intercept.
3. **Too many variables relative to observations:** $k > n$.

**Example 3.2:** If we include both a male dummy and a female dummy (along with an intercept), then (male dummy) + (female dummy) = (column of ones). The three columns are linearly dependent; $\mathbf{X}^T \mathbf{X}$ is singular and the OLS estimator does not exist.

---

## 3.3 OLS Derivation via Minimization

Alternatively, define the **sum of squared residuals (SSR)**:

$$SSR(\hat{\boldsymbol{\beta}}) = (\mathbf{y} - \mathbf{X}\hat{\boldsymbol{\beta}})^T (\mathbf{y} - \mathbf{X}\hat{\boldsymbol{\beta}}) = \sum_{i=1}^n (y_i - \mathbf{x}_i^T \hat{\boldsymbol{\beta}})^2 = \|\mathbf{y} - \mathbf{X}\hat{\boldsymbol{\beta}}\|^2$$

The **Ordinary Least Squares** estimator minimizes the SSR:

$$\hat{\boldsymbol{\beta}}^{OLS} = \underset{\hat{\boldsymbol{\beta}}}{\operatorname{argmin}} \ \|\mathbf{y} - \mathbf{X}\hat{\boldsymbol{\beta}}\|^2$$

**Derivation:** Expand the objective function:

$$SSR = \mathbf{y}^T\mathbf{y} - 2\hat{\boldsymbol{\beta}}^T \mathbf{X}^T\mathbf{y} + \hat{\boldsymbol{\beta}}^T \mathbf{X}^T\mathbf{X} \hat{\boldsymbol{\beta}}$$

Taking the derivative with respect to $\hat{\boldsymbol{\beta}}$ and setting to zero:

$$\frac{\partial SSR}{\partial \hat{\boldsymbol{\beta}}} = -2\mathbf{X}^T\mathbf{y} + 2\mathbf{X}^T\mathbf{X}\hat{\boldsymbol{\beta}} = \mathbf{0}$$

This gives exactly the normal equations. The second-order condition requires $\mathbf{X}^T\mathbf{X}$ to be positive definite, which holds when $\mathbf{X}$ has full rank. $\square$

> **The equivalence of MM and OLS** follows because the moment conditions and the first-order conditions of the least-squares problem are identical. This is a special property of linear models.

---

## 3.4 Linear Regression as Orthogonal Projection

The geometric interpretation of OLS is the most insightful way to understand what the estimator is doing. This section requires thinking of vectors and matrices in $\mathbb{R}^n$.

### 3.4.1 Vectors in $\mathbb{R}^n$

Think of $\mathbf{y} = (y_1, \ldots, y_n)^T$ as a single point (or arrow from the origin) in $n$-dimensional Euclidean space $E^n$. Similarly, each column of $\mathbf{X}$ is a vector in $E^n$.

The **scalar product** (inner product) of two vectors $\mathbf{a}, \mathbf{b} \in E^n$ is:

$$\langle \mathbf{a}, \mathbf{b} \rangle = \mathbf{a}^T \mathbf{b} = \sum_{i=1}^n a_i b_i$$

The **length** (norm) of a vector is:

$$\|\mathbf{a}\| = \sqrt{\langle \mathbf{a}, \mathbf{a} \rangle} = \sqrt{\sum_{i=1}^n a_i^2}$$

Two vectors are **orthogonal** if $\langle \mathbf{a}, \mathbf{b} \rangle = 0$. The **Cauchy-Schwarz inequality** states: $|\langle \mathbf{a}, \mathbf{b} \rangle| \leq \|\mathbf{a}\| \|\mathbf{b}\|$.

### 3.4.2 The Column Space of X

The **column space** of $\mathbf{X}$, denoted $\mathcal{S}(\mathbf{X})$, is the set of all vectors that can be written as a linear combination of the columns of $\mathbf{X}$:

$$\mathcal{S}(\mathbf{X}) = \left\{\mathbf{z} \in E^n : \mathbf{z} = \mathbf{X}\mathbf{b} \text{ for some } \mathbf{b} \in \mathbb{R}^k\right\}$$

When $\mathbf{X}$ has rank $k$, $\mathcal{S}(\mathbf{X})$ is a $k$-dimensional **subspace** of $E^n$.

**Key insight:** The fitted values $\mathbf{X}\hat{\boldsymbol{\beta}}$ lie in $\mathcal{S}(\mathbf{X})$ for *any* choice of $\hat{\boldsymbol{\beta}}$.

### 3.4.3 OLS as Closest Point in the Column Space

The OLS problem asks: **which point in $\mathcal{S}(\mathbf{X})$ is closest to $\mathbf{y}$?**

Formally: find $\hat{\mathbf{y}} = \mathbf{X}\hat{\boldsymbol{\beta}} \in \mathcal{S}(\mathbf{X})$ that minimizes $\|\mathbf{y} - \hat{\mathbf{y}}\|^2$.

**The answer is the orthogonal projection of $\mathbf{y}$ onto $\mathcal{S}(\mathbf{X})$.**

This is the point in $\mathcal{S}(\mathbf{X})$ such that the residual vector $\hat{\mathbf{u}} = \mathbf{y} - \hat{\mathbf{y}}$ is **orthogonal** to every vector in $\mathcal{S}(\mathbf{X})$:

$$\mathbf{X}^T \hat{\mathbf{u}} = \mathbf{0}$$

This is exactly the normal equation, confirming the geometric interpretation.

> **Figure 3.1 (Geometric Interpretation):** Imagine $n = 3$ observations and $k = 2$ regressors (including the constant). The column space $\mathcal{S}(\mathbf{X})$ is a 2-dimensional plane in 3-dimensional space. The vector $\mathbf{y}$ is a point in 3D space, generally not lying in the plane. The OLS fitted value $\hat{\mathbf{y}}$ is the point in the plane closest to $\mathbf{y}$, obtained by dropping a perpendicular from $\mathbf{y}$ onto the plane. The residual vector $\hat{\mathbf{u}} = \mathbf{y} - \hat{\mathbf{y}}$ is the perpendicular.

---

## 3.5 Projection Matrices: $\mathbf{P_X}$ and $\mathbf{M_X}$

### 3.5.1 The Hat Matrix $\mathbf{P_X}$

The **orthogonal projection matrix** onto $\mathcal{S}(\mathbf{X})$ is:

$$\mathbf{P_X} = \mathbf{X}(\mathbf{X}^T \mathbf{X})^{-1} \mathbf{X}^T$$

This is also called the **hat matrix** (because it "puts a hat on" $\mathbf{y}$):

$$\hat{\mathbf{y}} = \mathbf{X}\hat{\boldsymbol{\beta}} = \mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T \mathbf{y} = \mathbf{P_X} \mathbf{y}$$

### 3.5.2 The Annihilator Matrix $\mathbf{M_X}$

The **orthogonal projection onto the orthogonal complement** of $\mathcal{S}(\mathbf{X})$ is:

$$\mathbf{M_X} = \mathbf{I}_n - \mathbf{P_X}$$

This matrix produces the OLS residuals:

$$\hat{\mathbf{u}} = \mathbf{y} - \hat{\mathbf{y}} = \mathbf{y} - \mathbf{P_X}\mathbf{y} = (\mathbf{I} - \mathbf{P_X})\mathbf{y} = \mathbf{M_X}\mathbf{y}$$

$\mathbf{M_X}$ is called the **annihilator** because it destroys (annihilates) any vector in $\mathcal{S}(\mathbf{X})$: $\mathbf{M_X}\mathbf{X} = \mathbf{0}$.

### 3.5.3 Key Properties of $\mathbf{P_X}$ and $\mathbf{M_X}$

**Property 3.1 (Symmetry):** $\mathbf{P_X}^T = \mathbf{P_X}$ and $\mathbf{M_X}^T = \mathbf{M_X}$.

**Property 3.2 (Idempotency):** $\mathbf{P_X}^2 = \mathbf{P_X}$ and $\mathbf{M_X}^2 = \mathbf{M_X}$.

*Proof:* $\mathbf{P_X}^2 = \mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T \cdot \mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T = \mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1}(\mathbf{X}^T\mathbf{X})(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T = \mathbf{P_X}$. $\square$

*Interpretation:* Projecting a vector twice onto the same subspace returns it to where it was after the first projection. Idempotency is the algebraic expression of this geometric fact.

**Property 3.3 (Annihilation):** $\mathbf{P_X}\mathbf{M_X} = \mathbf{M_X}\mathbf{P_X} = \mathbf{0}$.

*Proof:* $\mathbf{P_X}\mathbf{M_X} = \mathbf{P_X}(\mathbf{I} - \mathbf{P_X}) = \mathbf{P_X} - \mathbf{P_X}^2 = \mathbf{P_X} - \mathbf{P_X} = \mathbf{0}$. $\square$

*Interpretation:* The subspace $\mathcal{S}(\mathbf{X})$ and its orthogonal complement are perpendicular; projecting onto one annihilates any component in the other.

**Property 3.4 (Trace):** $\text{tr}(\mathbf{P_X}) = k$ and $\text{tr}(\mathbf{M_X}) = n - k$.

*Proof:* $\text{tr}(\mathbf{P_X}) = \text{tr}(\mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T) = \text{tr}((\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{X}) = \text{tr}(\mathbf{I}_k) = k$, using the cyclic property of trace. $\square$

*Interpretation:* The trace of a projection matrix equals the dimension of the subspace it projects onto. The hat matrix projects onto a $k$-dimensional space; the annihilator projects onto an $(n-k)$-dimensional space.

**Property 3.5 (Invariance of projection):** $\mathbf{P_X}\mathbf{X} = \mathbf{X}$.

*Proof:* Any vector in $\mathcal{S}(\mathbf{X})$ maps to itself under the projection. $\mathbf{X}$ is in $\mathcal{S}(\mathbf{X})$ (each column is). $\square$

**Property 3.6 (OLS residuals and regressors are orthogonal):** $\mathbf{X}^T\hat{\mathbf{u}} = \mathbf{0}$.

*Proof:* $\mathbf{X}^T\hat{\mathbf{u}} = \mathbf{X}^T\mathbf{M_X}\mathbf{y} = (\mathbf{M_X}\mathbf{X})^T\mathbf{y} = \mathbf{0}^T\mathbf{y} = \mathbf{0}$. $\square$

---

## 3.6 The Pythagorean Theorem and Goodness of Fit ($R^2$)

### 3.6.1 Sum of Squares Decomposition

By the geometry of projections (Pythagorean theorem in $E^n$):

$$\|\mathbf{y}\|^2 = \|\mathbf{P_X}\mathbf{y}\|^2 + \|\mathbf{M_X}\mathbf{y}\|^2$$

In more familiar notation (when an intercept is included in $\mathbf{X}$):

$$\underbrace{\|\mathbf{y} - \bar{y}\boldsymbol{\iota}\|^2}_{TSS} = \underbrace{\|\hat{\mathbf{y}} - \bar{y}\boldsymbol{\iota}\|^2}_{ESS} + \underbrace{\|\hat{\mathbf{u}}\|^2}_{SSR}$$

where:
- $TSS = \sum_{i=1}^n (y_i - \bar{y})^2$ is the **Total Sum of Squares**
- $ESS = \sum_{i=1}^n (\hat{y}_i - \bar{y})^2$ is the **Explained Sum of Squares**
- $SSR = \sum_{i=1}^n \hat{u}_i^2$ is the **Sum of Squared Residuals**

*Proof that $TSS = ESS + SSR$:* Write $\mathbf{y} - \bar{y}\boldsymbol{\iota} = (\hat{\mathbf{y}} - \bar{y}\boldsymbol{\iota}) + \hat{\mathbf{u}}$. Squaring: $\|\mathbf{y} - \bar{y}\boldsymbol{\iota}\|^2 = \|\hat{\mathbf{y}} - \bar{y}\boldsymbol{\iota}\|^2 + \|\hat{\mathbf{u}}\|^2 + 2(\hat{\mathbf{y}} - \bar{y}\boldsymbol{\iota})^T\hat{\mathbf{u}}$. The cross term is zero because $\hat{\mathbf{u}} \perp \mathcal{S}(\mathbf{X})$ and $(\hat{\mathbf{y}} - \bar{y}\boldsymbol{\iota}) \in \mathcal{S}(\mathbf{X})$. $\square$

### 3.6.2 The Coefficient of Determination ($R^2$)

**Definition 3.1 (Centered $R^2$):**

$$R_c^2 = \frac{ESS}{TSS} = 1 - \frac{SSR}{TSS} = \frac{\|\mathbf{P_X}\mathbf{M_\iota}\mathbf{y}\|^2}{\|\mathbf{M_\iota}\mathbf{y}\|^2}$$

where $\mathbf{M_\iota} = \mathbf{I} - \frac{1}{n}\boldsymbol{\iota}\boldsymbol{\iota}^T$ is the demeaning matrix.

**Definition 3.2 (Uncentered $R^2$):**

$$R_u^2 = \frac{\|\mathbf{P_X}\mathbf{y}\|^2}{\|\mathbf{y}\|^2}$$

**Properties of $R^2$:**

1. $0 \leq R^2 \leq 1$ (when an intercept is included).
2. $R^2$ is the square of the sample correlation between $\hat{y}_i$ and $y_i$.
3. Adding more regressors never decreases $R^2$ (but may be pure noise fitting).
4. $R^2$ measures **in-sample fit**, not predictive accuracy or causal validity.

> **Warning:** A high $R^2$ does not mean the regression is correctly specified or that the coefficients are causally interpretable. A low $R^2$ does not mean the regression is useless — in many empirical settings, including program evaluation, $R^2$ values of 0.05–0.20 are common even when the estimates are valid.

**Definition 3.3 (Adjusted $R^2$):** To penalize for the number of regressors:

$$\bar{R}^2 = 1 - \frac{SSR/(n-k)}{TSS/(n-1)} = 1 - (1 - R^2)\frac{n-1}{n-k}$$

The adjusted $R^2$ can decrease when an irrelevant variable is added.

---

## 3.7 Linear Transformations and Invariance Results

### 3.7.1 Rescaling Regressors

If we replace $\mathbf{X}$ with $\mathbf{Z} = \mathbf{X}\mathbf{A}$ where $\mathbf{A}$ is a $k \times k$ full-rank matrix, then the OLS fitted values are unchanged:

$$\mathbf{P_Z} = \mathbf{P_X}$$

and the coefficient estimates satisfy:

$$\mathbf{A}\hat{\boldsymbol{\alpha}} = \hat{\boldsymbol{\beta}}$$

where $\hat{\boldsymbol{\alpha}}$ is the OLS estimate from regressing $\mathbf{y}$ on $\mathbf{Z}$.

**Implication:** OLS coefficients change predictably when units change. If we measure income in \$000 instead of dollars, the coefficient on income is multiplied by 1000. If we take the log of income, the coefficient changes entirely. But the fitted values, residuals, and $R^2$ are invariant to linear transformations.

### 3.7.2 Demeaning as a Linear Transformation

An important special case: subtracting the mean $\bar{x}$ from each regressor (demeaning).

$$Z_i = X_i - \bar{X}$$

Under this transformation:
- The intercept changes but all slope coefficients are unchanged.
- The $R^2$ and residuals are unchanged.
- The demeaned regression $\tilde{y}_i = \mathbf{M_\iota}\mathbf{y}$ on $\tilde{X}_i = \mathbf{M_\iota}\mathbf{X}$ gives the same slopes as the original regression.

This is a special case of the **Frisch-Waugh-Lovell (FWL) Theorem**.

### 3.7.3 The Frisch-Waugh-Lovell Theorem

This theorem is one of the most useful results in regression analysis. It shows that the coefficients on a subset of regressors can be obtained by "partialling out" the other regressors.

**Theorem 3.1 (Frisch-Waugh-Lovell):** Partition the design matrix as $\mathbf{X} = [\mathbf{X_1} \: \mathbf{X_2}]$, where $\mathbf{X_1}$ is $n \times k_1$ and $\mathbf{X_2}$ is $n \times k_2$, with $k_1 + k_2 = k$. The OLS estimator of $\boldsymbol{\beta_2}$ from the full regression $\mathbf{y} = \mathbf{X_1}\boldsymbol{\beta_1} + \mathbf{X_2}\boldsymbol{\beta_2} + \mathbf{u}$ equals the OLS estimator from the "residualized" regression:

$$\hat{\boldsymbol{\beta}}_2^{FWL} = (\tilde{\mathbf{X}}_2^T \tilde{\mathbf{X}}_2)^{-1} \tilde{\mathbf{X}}_2^T \tilde{\mathbf{y}}$$

where $\tilde{\mathbf{y}} = \mathbf{M_{X_1}}\mathbf{y}$ and $\tilde{\mathbf{X}}_2 = \mathbf{M_{X_1}}\mathbf{X_2}$ are the residuals from regressing $\mathbf{y}$ and $\mathbf{X_2}$, respectively, on $\mathbf{X_1}$.

Moreover, $\hat{\boldsymbol{\beta}}_2^{FWL} = \hat{\boldsymbol{\beta}}_2^{OLS}$ and the residuals from both regressions are identical.

**Proof sketch:** Let $\tilde{\mathbf{y}} = \mathbf{M_{X_1}}\mathbf{y}$ and $\tilde{\mathbf{X}}_2 = \mathbf{M_{X_1}}\mathbf{X}_2$. Then $\tilde{\mathbf{X}}_2^T\tilde{\mathbf{y}} = \mathbf{X}_2^T\mathbf{M_{X_1}}\mathbf{y}$ (since $\mathbf{M_{X_1}}$ is symmetric). One can show by substitution that the normal equations of the FWL regression are equivalent to the normal equations of the full regression projected onto the $\boldsymbol{\beta}_2$ block. The residuals are the same because $\mathbf{M_X} = \mathbf{M_{X_1}}\mathbf{M}_{[\mathbf{M_{X_1}}\mathbf{X_2}]}$. (See Davidson and MacKinnon (2004), Chapter 2 for a complete proof.) $\square$

> **Why the FWL Theorem Matters:**
>
> 1. **Interpreting multiple regression.** The coefficient on $X_{2i}$ in a multiple regression is the effect of $X_{2i}$ on $y_i$ after "controlling for" $X_{1i}$ — specifically, after removing the part of both $y_i$ and $X_{2i}$ that is linearly predictable from $X_{1i}$.
>
> 2. **Partial effects.** The FWL theorem shows that OLS coefficients measure *partial* effects: the marginal association between $y$ and one regressor, holding the other regressors fixed.
>
> 3. **Omitted variable bias.** If we omit $\mathbf{X_1}$ from the regression, $\hat{\boldsymbol{\beta}}_2$ will be biased if $\mathbf{X_1}$ is correlated with $\mathbf{X_2}$ (since we won't residualize $\mathbf{X_2}$ on $\mathbf{X_1}$).

**Example 3.3 (FWL in the Wage Regression):** In the wage regression with education and experience, the FWL theorem says:
1. Regress log wages on experience; save residuals $\tilde{y}_i$.
2. Regress education on experience; save residuals $\tilde{\text{educ}}_i$.
3. Regress $\tilde{y}_i$ on $\tilde{\text{educ}}_i$ (no intercept needed); the slope is the education coefficient from the full regression.

The slope in step 3 measures the return to education *after* removing the variation in both wages and education that is due to experience.

---

## Chapter Summary

- The multiple regression model in matrix notation is $\mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \mathbf{u}$.
- The OLS estimator $\hat{\boldsymbol{\beta}} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{y}$ is derived by minimizing the SSR or equating sample moments to zero.
- OLS is geometrically an **orthogonal projection** of $\mathbf{y}$ onto the column space of $\mathbf{X}$.
- The **projection matrices** $\mathbf{P_X} = \mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T$ and $\mathbf{M_X} = \mathbf{I} - \mathbf{P_X}$ are symmetric, idempotent, and annihilate each other.
- The **Pythagorean decomposition** $TSS = ESS + SSR$ follows from the geometry of projections.
- The **$R^2$** measures in-sample fit as the fraction of variance explained by the regressors.
- The **FWL Theorem** shows that OLS coefficients measure partial effects after residualizing on the other regressors.

---

## Key Terms

**Design matrix** ($\mathbf{X}$) — the $n \times k$ matrix of observations on the regressors.

**Normal equations** — $\mathbf{X}^T\mathbf{X}\hat{\boldsymbol{\beta}} = \mathbf{X}^T\mathbf{y}$; the first-order conditions for the OLS estimator.

**Full rank** — $\mathbf{X}$ has full column rank $k$ (no perfect multicollinearity).

**OLS estimator** — $\hat{\boldsymbol{\beta}} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{y}$.

**Column space** ($\mathcal{S}(\mathbf{X})$) — the set of all vectors of the form $\mathbf{X}\mathbf{b}$ for $\mathbf{b} \in \mathbb{R}^k$.

**Projection matrix** ($\mathbf{P_X}$) — $\mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T$; projects onto $\mathcal{S}(\mathbf{X})$.

**Annihilator matrix** ($\mathbf{M_X}$) — $\mathbf{I} - \mathbf{P_X}$; projects onto the orthogonal complement of $\mathcal{S}(\mathbf{X})$.

**Idempotent** — a matrix $\mathbf{A}$ such that $\mathbf{A}^2 = \mathbf{A}$.

**Frisch-Waugh-Lovell (FWL) Theorem** — the coefficient on $\mathbf{X_2}$ in the full regression equals the coefficient from regressing residualized $\mathbf{y}$ on residualized $\mathbf{X_2}$.

**$R^2$** — fraction of total variation in $y$ explained by $\mathbf{X}$; $R^2 = ESS/TSS$.

---

## Exercises

### Conceptual Questions

**3.1** Explain in your own words why the OLS estimator can be interpreted as an orthogonal projection.

**3.2** What is the geometric interpretation of the OLS residuals $\hat{\mathbf{u}}$? What does it mean for $\hat{\mathbf{u}}$ to be orthogonal to the columns of $\mathbf{X}$?

**3.3** "If we add a variable that is completely uncorrelated with all existing regressors and the outcome variable, $R^2$ does not change." Is this true? Explain.

**3.4** You run a regression of test scores on class size and find $R^2 = 0.02$. A colleague says the regression is worthless because $R^2$ is so low. How would you respond?

**3.5** State the FWL Theorem. Give an intuitive explanation of why the "residualized regression" gives the same coefficient as the full regression.

### Analytical Questions

**3.6** Prove that the hat matrix $\mathbf{P_X}$ is symmetric and idempotent.

**3.7** Show that $\hat{\boldsymbol{\beta}}$ from a regression of $\mathbf{y}$ on $\mathbf{X}$ and $\hat{\boldsymbol{\beta}}$ from a regression of $\mathbf{M_\iota}\mathbf{y}$ on $\mathbf{M_\iota}\mathbf{X}$ (i.e., demeaned regression) give the same slope coefficients.

**3.8** Consider the simple bivariate regression $y_i = \alpha + \beta x_i + u_i$. 

(a) Show that $\hat{\beta} = \frac{\sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y})}{\sum_{i=1}^n (x_i - \bar{x})^2}$.

(b) Show that $\hat{\alpha} = \bar{y} - \hat{\beta}\bar{x}$.

(c) Show that the OLS regression line passes through the point $(\bar{x}, \bar{y})$.

**3.9** Consider the regression of $y_i$ on $x_i$ and $z_i$. If $x_i$ and $z_i$ are orthogonal in the sample ($\sum x_i z_i = 0$ after demeaning), show that the OLS coefficient on $x_i$ from the multiple regression equals the OLS coefficient on $x_i$ from the simple regression of $y_i$ on $x_i$ alone.

**3.10** Show that $\text{tr}(\mathbf{M_X}) = n - k$.

**3.11** Let $\mathbf{X}_1 = \boldsymbol{\iota}$ (column of ones). Show that $\mathbf{M_{X_1}} = \mathbf{M_\iota}$ is the demeaning matrix: $\mathbf{M_\iota}\mathbf{y} = \mathbf{y} - \bar{y}\boldsymbol{\iota}$.

### Applied Questions

**3.12** You have data on $n = 500$ workers with: log wages ($y$), years of education ($x_1$), and a dummy for urban residence ($x_2$). 

(a) Write out the full OLS estimator in matrix form.
(b) Describe what the FWL theorem says about the coefficient on education in this regression.
(c) If education is positively correlated with urban residence, and urban workers earn higher wages, what happens to the education coefficient if you omit the urban dummy?

**3.13** Using the data from R Lab 2, verify the FWL Theorem numerically: (a) run the full regression of log wages on education and experience; (b) residualize log wages and education on experience; (c) regress the residualized wages on residualized education; (d) confirm the slopes in (a) and (c) match.

---

## R Lab 3: OLS in Matrix Form and the Geometry of Regression

### Objectives
- Compute OLS directly using matrix algebra
- Construct and verify projection matrices
- Verify the FWL theorem numerically
- Visualize the sum-of-squares decomposition

### Setup

```r
library(tidyverse)
library(AER)
data("CPS1988")
CPS1988 <- CPS1988 %>% mutate(log_wage = log(wage))
```

### Exercise 3.1: OLS via Matrix Algebra

```r
# Create the design matrix
y <- as.matrix(CPS1988$log_wage)
X <- cbind(1, CPS1988$education, CPS1988$experience, CPS1988$experience^2)
colnames(X) <- c("intercept", "education", "experience", "experience_sq")

n <- nrow(X)
k <- ncol(X)

# OLS estimator: beta_hat = (X'X)^{-1} X'y
XtX     <- t(X) %*% X
Xty     <- t(X) %*% y
beta_hat <- solve(XtX) %*% Xty
print(round(beta_hat, 4))

# Compare with lm()
lm_model <- lm(log_wage ~ education + experience + I(experience^2), data = CPS1988)
print(round(coef(lm_model), 4))
```

### Exercise 3.2: Projection Matrices

```r
# Hat matrix P_X
P_X <- X %*% solve(XtX) %*% t(X)

# Annihilator M_X
M_X <- diag(n) - P_X

# Verify properties
cat("Is P_X idempotent?", all.equal(P_X %*% P_X, P_X, check.attributes = FALSE), "\n")
cat("Is M_X idempotent?", all.equal(M_X %*% M_X, M_X, check.attributes = FALSE), "\n")

# Fitted values and residuals
y_hat <- P_X %*% y        # fitted values
u_hat <- M_X %*% y        # residuals

# Check: X'u_hat = 0 (should be numerically zero)
cat("Max |X'u_hat|:", max(abs(t(X) %*% u_hat)), "\n")

# Trace of projection matrices
cat("tr(P_X) =", round(sum(diag(P_X)), 2), "(should be", k, ")\n")
cat("tr(M_X) =", round(sum(diag(M_X)), 2), "(should be", n - k, ")\n")
```

### Exercise 3.3: Sum of Squares Decomposition

```r
# Demeaning matrix
iota <- matrix(1, n, 1)
M_iota <- diag(n) - (1/n) * (iota %*% t(iota))

TSS <- as.numeric(t(y)   %*% M_iota %*% y)   # Total SS (demeaned)
ESS <- as.numeric(t(y_hat) %*% M_iota %*% y_hat)  # Explained SS
SSR <- as.numeric(t(u_hat) %*% u_hat)          # Residual SS

cat("TSS:", round(TSS, 4), "\n")
cat("ESS:", round(ESS, 4), "\n")
cat("SSR:", round(SSR, 4), "\n")
cat("ESS + SSR:", round(ESS + SSR, 4), "(should equal TSS)\n")

R_squared <- ESS / TSS
cat("R-squared:", round(R_squared, 4), "\n")
cat("R-squared from lm():", round(summary(lm_model)$r.squared, 4), "\n")
```

### Exercise 3.4: Verifying the FWL Theorem

```r
# Full regression: log_wage ~ education + experience + experience^2
# FWL for the education coefficient

# Step 1: Partition X1 (intercept + experience) and X2 (education)
X1 <- cbind(1, CPS1988$experience, CPS1988$experience^2)
X2 <- as.matrix(CPS1988$education)

# Step 2: Residualize y and X2 on X1
M_X1 <- diag(n) - X1 %*% solve(t(X1) %*% X1) %*% t(X1)
y_tilde  <- M_X1 %*% y
X2_tilde <- M_X1 %*% X2

# Step 3: FWL regression
beta_FWL <- solve(t(X2_tilde) %*% X2_tilde) %*% t(X2_tilde) %*% y_tilde
cat("FWL estimate of education coefficient:", round(beta_FWL, 6), "\n")
cat("Full OLS estimate of education coefficient:", round(beta_hat["education",], 6), "\n")

# Confirm residuals are the same
u_FWL <- y_tilde - X2_tilde %*% beta_FWL
cat("Max difference in residuals:", max(abs(u_hat - u_FWL)), "\n")
```

### Exercise 3.5: Visualizing OLS Geometry (2D Approximation)

```r
# Simplified example: 3 observations, 2 regressors (for visualization)
set.seed(123)
n_small <- 3
x_small <- c(1, 2, 4)
y_small <- c(2, 3, 5)
X_small <- cbind(1, x_small)
beta_small <- solve(t(X_small) %*% X_small) %*% t(X_small) %*% y_small
y_hat_small <- X_small %*% beta_small
u_small <- y_small - y_hat_small

cat("Observations:", y_small, "\n")
cat("Fitted values:", round(y_hat_small, 3), "\n")
cat("Residuals:", round(u_small, 3), "\n")
cat("OLS coefficients:", round(beta_small, 3), "\n")
cat("SSR:", round(sum(u_small^2), 4), "\n")

# Verify orthogonality
cat("X'u_hat:", round(t(X_small) %*% u_small, 6), "\n")
```

---

*End of Chapter 3*

---

**References**

Davidson, R., and MacKinnon, J. G. (2004). *Econometric Theory and Methods*. Oxford University Press. Chapter 2, Sections 2.1–2.4.

Angrist, J. D., and Pischke, J. (2009). *Mostly Harmless Econometrics*. Princeton University Press. Chapter 3.

Wooldridge, J. M. (2019). *Introductory Econometrics* (7th ed.). Cengage. Chapters 3–4.

Frisch, R., and Waugh, F. V. (1933). Partial time regressions as compared with individual trends. *Econometrica*, 1(4), 387–401.

Lovell, M. C. (1963). Seasonal adjustment of economic time series and multiple regression analysis. *Journal of the American Statistical Association*, 58(304), 993–1010.
