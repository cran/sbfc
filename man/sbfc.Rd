% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sbfc.R
\name{sbfc}
\alias{sbfc}
\title{Selective Bayesian Forest Classifier (SBFC) algorithm}
\usage{
sbfc(
  data,
  nstep = NULL,
  thin = 50,
  burnin_denom = 5,
  cv = T,
  thinoutputs = F,
  alpha = 5,
  y_penalty = 1,
  x_penalty = 4
)
}
\arguments{
\item{data}{Discretized data set:
\describe{     
\item{\code{TrainX}}{Matrix containing the training data.}
\item{\code{TrainY}}{Vector containing the class labels for the training data.}
\item{\code{TestX}}{Matrix containing the test data (optional).}
\item{\code{TestY}}{Vector containing the class labels for the test data (optional).}
}}

\item{nstep}{Number of MCMC steps, default max(10000, 10 * ncol(TrainX)).}

\item{thin}{Thinning factor for the MCMC.}

\item{burnin_denom}{Denominator of the fraction of total MCMC steps discarded as burnin (default=5).}

\item{cv}{Do cross-validation on the training set (if test set is not provided).}

\item{thinoutputs}{Return thinned MCMC outputs (parents, groups, trees, logposterior), rather than all outputs (default=FALSE).}

\item{alpha}{Dirichlet hyperparameter(default=1)}

\item{y_penalty}{Prior coefficient for y-edges, which penalizes signal group size (default=1)}

\item{x_penalty}{Prior coefficient for x-edges, which penalizes tree size (default=4)}
}
\value{
An object of class \code{sbfc}:
\describe{     
\item{\code{accuracy}}{Classification accuracy (on the test set if provided, otherwise cross-validation accuracy on training set).}
\item{\code{predictions}}{Vector of class label predictions (for the test set if provided, otherwise for the training set).}
\item{\code{probabilities}}{Matrix of class label probabilities (for the test set if provided, otherwise for the training set).}
\item{\code{runtime}}{Total runtime of the algorithm in seconds.}
\item{\code{parents}}{Matrix representing the structures sampled by MCMC, where parents[i,j] is the index of the parent of node j at iteration i (0 if node is a root).}
\item{\code{groups}}{Matrix representing the structures sampled by MCMC, where groups[i,j] indicates which group node j belongs to at iteration j (0 is noise, 1 is signal).}
\item{\code{trees}}{Matrix representing the structures sampled by MCMC, where trees[i,j] indicates which tree node j belongs to at iteration j.}
\item{\code{logposterior}}{Vector representing the log posterior at each iteration of the MCMC.}
\item{Parameters}{\code{nstep}, \code{thin}, \code{burnin_denom}, \code{cv}, \code{thinoutputs}, \code{alpha}, \code{y_penalty}, \code{x_penalty}.}
}
If \code{cv=TRUE}, the MCMC samples from the first fold are returned (\code{parents}, \code{groups}, \code{trees}, \code{logposterior}).
}
\description{
Runs the SBFC algorithm on a discretized data set. To discretize your data, use the \code{\link{data_disc}} command.
}
\details{
Data needs to be discretized before running SBFC. \cr
If the test data matrix TestX is provided, SBFC runs on the entire training set TrainX, and provides predicted class labels for the test data. 
If the test data class vector TestY is provided, the accuracy is computed. 
If the test data matrix TestX is not provided, and cv is set to TRUE, SBFC performs cross-validation on the training data set TrainX, 
and returns predicted classes and accuracy for the training data. \cr
}
\examples{
data(madelon)
madelon_result = sbfc(madelon)
data(heart)
heart_result = sbfc(heart, cv=FALSE)
}
