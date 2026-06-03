# =========================
# Labour–Leisure (Dark Curves) with SE/IE Below X-Axis
# U = ln(C) + alpha ln(L)
# =========================

alpha <- 0.8
T  <- 80
V  <- 500
w1 <- 20
w2 <- 30

# Marshallian optima
marshall_L <- function(w, V) {
  I <- V + w*T
  (alpha/(1+alpha)) * I / w
}
marshall_C <- function(w, V) {
  I <- V + w*T
  (1/(1+alpha)) * I
}
utility <- function(C, L) log(C) + alpha*log(L)

# Points A and C
L_A <- marshall_L(w1, V)
C_A <- marshall_C(w1, V)
U_A <- utility(C_A, L_A)

L_C <- marshall_L(w2, V)
C_C <- marshall_C(w2, V)
U_C <- utility(C_C, L_C)

# Hicks full income for compensated point B (closed form; no uniroot)
hicks_full_income <- function(Ubar, w) {
  num <- Ubar - alpha*log(alpha) + (1+alpha)*log(1+alpha) + alpha*log(w)
  exp(num/(1+alpha))
}
I_B <- hicks_full_income(U_A, w2)
V_B <- I_B - w2*T

# Compensated point B on compensated budget with slope -w2
L_B <- (alpha/(1+alpha)) * I_B / w2
C_B <- (1/(1+alpha)) * I_B

# Grid
Lgrid <- seq(1, T, length.out = 800)

# Budget lines in (L,C) space: C = V + w(T-L)
C1 <- V   + w1*(T - Lgrid)
C2 <- V   + w2*(T - Lgrid)
CH <- V_B + w2*(T - Lgrid)

# Indifference curves through A and C
C_UA <- exp(U_A - alpha*log(Lgrid))
C_UC <- exp(U_C - alpha*log(Lgrid))

# --- Plot limits: add space below x-axis for SE/IE arrows/labels ---
y_top <- max(C2, na.rm = TRUE)
y_bot <- -0.18 * y_top   # space below 0 for annotations

# Plot base (original budget)
plot(Lgrid, C1, type="l", lwd=3, col="black",
     xlab="Leisure (L)", ylab="Consumption (C)",
     xlim=c(0, T), ylim=c(y_bot, y_top),
     xaxs="i", yaxs="i")

# Add curves (dark & thick)
lines(Lgrid, C2, lwd=3, lty=2, col="darkred")
lines(Lgrid, CH, lwd=3, lty=4, col="purple4")
lines(Lgrid, C_UA, lwd=2.5, lty=3, col="darkgreen")
lines(Lgrid, C_UC, lwd=2.5, lty=3, col="darkgreen")

# Tangency points
points(L_A, C_A, pch=19, cex=1.1)
points(L_B, C_B, pch=19, cex=1.1)
points(L_C, C_C, pch=19, cex=1.1)

# Dashed projections to axes (from A and C)
segments(L_A, 0, L_A, C_A, lty=3)
segments(0, C_A, L_A, C_A, lty=3)

segments(L_C, 0, L_C, C_C, lty=3)
segments(0, C_C, L_C, C_C, lty=3)

# Minimal point labels (kept away from curves)
text(L_A + 3, C_A + 0.03*y_top, "A", cex=1.0)
text(L_B + 3, C_B + 0.03*y_top, "B", cex=1.0)
text(L_C + 3, C_C + 0.02*y_top, "C", cex=1.0)

# --- SE/IE arrows and labels BELOW the x-axis ---
y_se <- 0.55 * y_bot  # negative value (below axis)
y_ie <- 0.80 * y_bot

# Substitution effect arrow: A -> B (projected below axis)
arrows(L_A, y_se, L_B, y_se, length=0.10, lwd=2)
text((L_A+L_B)/2, y_se, "SE", pos=3, cex=1.0)

# Income effect arrow: B -> C (projected below axis)
arrows(L_B, y_ie, L_C, y_ie, length=0.10, lwd=2)
text((L_B+L_C)/2, y_ie, "IE", pos=3, cex=1.0)

# Optional: small vertical markers from A,B,C down to the below-axis arrows (helps students)
segments(L_A, 0, L_A, y_se, lty=3)
segments(L_B, 0, L_B, y_se, lty=3)
segments(L_C, 0, L_C, y_ie, lty=3)

# Curve legend (dark)
legend("topright",
       legend=c("w = 20", "w = 30", "Compensated", "Indifference"),
       col=c("black", "darkred", "purple4", "darkgreen"),
       lty=c(1,2,4,3), lwd=c(3,3,3,2.5), bty="n")
