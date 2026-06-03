# =========================
# Problem 5: Labour Market Diagram (Minimal labels + coloured curves)
# =========================

Ld <- function(w) 100 - 2*w
Ls <- function(w) 20 + 3*w

w <- seq(0, 40, length.out = 400)

Ld_vals <- Ld(w)
Ls_vals <- Ls(w)

# Equilibrium
w_star <- 16
L_star <- 68

# Minimum wage
w_min <- 18
L_d_min <- Ld(w_min)
L_s_min <- Ls(w_min)

# Plot (use dark/high-contrast colours)
plot(Ld_vals, w, type = "l", lwd = 3, col = "black",
     xlab = "Labour (L)",
     ylab = "Wage (w)",
     xlim = c(0, 120),
     ylim = c(0, 40),
     xaxs = "i", yaxs = "i")

lines(Ls_vals, w, lwd = 3, lty = 2, col = "darkred")

# Minimum wage line
abline(h = w_min, lty = 3, lwd = 3, col = "purple4")

# Equilibrium point + dashed guides (minimal label)
points(L_star, w_star, pch = 19, cex = 1.1)
segments(L_star, 0, L_star, w_star, lty = 3)
segments(0, w_star, L_star, w_star, lty = 3)
text(L_star + 3, w_star + 0.3, "E", cex = 0.9)

# Points at minimum wage (employment and labour supplied) + dashed guides
points(L_d_min, w_min, pch = 19, cex = 1.1)
points(L_s_min, w_min, pch = 19, cex = 1.1)

segments(L_d_min, 0, L_d_min, w_min, lty = 3)
segments(L_s_min, 0, L_s_min, w_min, lty = 3)

# Unemployment gap at w_min (horizontal segment)
segments(L_d_min, w_min, L_s_min, w_min, lwd = 3)

# Minimal labels
text(L_d_min, w_min + 0.6, "Ld", cex = 0.85, pos = 2)
text(L_s_min, w_min + 0.4, "Ls", cex = 0.85, pos = 4)
text(-2, w_min + 0.5, "w_m", cex = 0.85, pos = 4)
text((L_d_min + L_s_min)/2, w_min + 1.2, "U", cex = 0.9)

legend("topright",
       legend = c("Demand", "Supply", "Min wage"),
       col = c("black", "darkred", "purple4"),
       lty = c(1, 2, 3),
       lwd = c(3, 3, 3),
       bty = "n")
