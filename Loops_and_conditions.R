
i <- 1
ifelse( i == 1, "Hello World", "Goodbye World" )

t <- c(1,2,1,1,0,0,1)
ifelse( t == 1, 3*t, 5*t )

# Switch Statements
lets_Switch <- function(x)
{
  switch (x,
    "a" = "alpha",
    "b" = "beta",
    "Wrong Option"
  )
}

lets_Switch("a")
lets_Switch("z")

# For Loop
for (i in 1:10) {
  print(i)
}

print(1:10)

# while Loop
y <- 1
while (y <= 5) {
  print(y)
  y <- y + 1
}


# Loop Controls
for( i in 1:10 )
{
  if(i == 3) next # execute next statement (like continue)
  if(i == 9) break
  print(i)
}


# Do Call Function
do_call <- function(x, func = mean)
{
  do.call(func,args = list(x))
}

do_call(1:15)
do_call(1:15,sd)
do_call(1:10,sum)
