# =========================================
# Helper: draw to screen AND save to PNG
# =========================================
save_and_show <- function(filename, draw_fun,
                          width=1100, height=700, res=140) {
  
  # 1) Show in RStudio Plots pane (interactive sessions)
  draw_fun()
  invisible(dev.flush())  # helps some devices update
  
  # 2) Save to file (always works)
  png(filename = filename, width = width, height = height, res = res)
  draw_fun()
  dev.off()
}

# =========================================
# Problem 1: Competitive market + surplus shading
# =========================================
save_and_show("prob1_competitive_surplus_shaded.png", function() {
  
  W <- seq(0, 45, length.out = 400)
  Ns <- 20*W
  Nd0 <- 400 - 10*W
  Nd1 <- 500 - 10*W
  
  # Equilibria
  W0 <- 40/3; N0 <- 800/3
  W1 <- 50/3; N1 <- 1000/3
  
  # Inverse curves (W as a function of N)
  W_supply <- function(N) N/20
  W_d0     <- function(N) 40 - N/10
  W_d1     <- function(N) 50 - N/10
  
  # Semi-transparent colors
  ws0_col <- adjustcolor("steelblue",  alpha.f = 0.25)
  fs0_col <- adjustcolor("darkorange", alpha.f = 0.25)
  ws1_col <- adjustcolor("royalblue",  alpha.f = 0.25)
  fs1_col <- adjustcolor("orangered3", alpha.f = 0.25)
  
  # Base plot
  plot(Ns, W, type="l", lwd=2,
       xlab="Employment (N)", ylab="Wage (W)",
       xlim=c(0, 520), ylim=c(0, 55),
       main="Competitive Labour Market: Worker & Firm Surplus (Before/After Demand Shift)")
  
  lines(Nd0, W, lwd=2)
  lines(Nd1, W, lwd=2, lty=2)
  
  # Shade BEFORE
  N_grid0 <- seq(0, N0, length.out = 400)
  polygon(c(N_grid0, rev(N_grid0)),
          c(rep(W0, length(N_grid0)), rev(W_supply(N_grid0))),
          col = ws0_col, border = NA)
  polygon(c(N_grid0, rev(N_grid0)),
          c(W_d0(N_grid0), rep(W0, length(N_grid0))),
          col = fs0_col, border = NA)
  
  # Shade AFTER
  N_grid1 <- seq(0, N1, length.out = 400)
  polygon(c(N_grid1, rev(N_grid1)),
          c(rep(W1, length(N_grid1)), rev(W_supply(N_grid1))),
          col = ws1_col, border = NA)
  polygon(c(N_grid1, rev(N_grid1)),
          c(W_d1(N_grid1), rep(W1, length(N_grid1))),
          col = fs1_col, border = NA)
  
  # Redraw curves on top
  lines(Ns, W, lwd=2)
  lines(Nd0, W, lwd=2)
  lines(Nd1, W, lwd=2, lty=2)
  
  points(N0, W0, pch=19); text(N0, W0, "  (N0, W0)", pos=4)
  points(N1, W1, pch=19); text(N1, W1, "  (N1, W1)", pos=4)
  
  abline(h = W0, lty = 3)
  abline(h = W1, lty = 3)
  
  legend("topright",
         legend=c("Supply: N=20W",
                  "Demand D: N=400-10W",
                  "Demand D': N=500-10W",
                  "Worker surplus (before)",
                  "Firm surplus (before)",
                  "Worker surplus (after)",
                  "Firm surplus (after)"),
         lwd=c(2,2,2, NA, NA, NA, NA),
         lty=c(1,1,2, NA, NA, NA, NA),
         pch=c(NA, NA, NA, 15, 15, 15, 15),
         pt.cex=1.6,
         col=c("black","black","black",
               ws0_col, fs0_col, ws1_col, fs1_col),
         bty="n")
})