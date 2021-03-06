% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sbfc.R
\name{sbfc_graph}
\alias{sbfc_graph}
\title{SBFC graph}
\usage{
sbfc_graph(
  sbfc_result,
  iter = 10000,
  average = T,
  edge_cutoff = 0.1,
  single_noise_nodes = F,
  labels = paste0("X", 1:ncol(sbfc_result$parents)),
  save_graphviz_code = F,
  colorscheme = "blues",
  ncolors = 7,
  width = NULL,
  height = NULL
)
}
\arguments{
\item{sbfc_result}{An object of class \code{sbfc}.}

\item{iter}{MCMC iteration of the sampled graph to plot, if \code{average=F} (default=10000).}

\item{average}{Plot an average of sampled MCMC graphs (default=TRUE).}

\item{edge_cutoff}{The average graph includes edges that appear in at least this fraction of the sampled graphs, if \code{average=T} (default=0.1).}

\item{single_noise_nodes}{Plot single-node trees that appear in the noise group (Group 0) in at least 80 percent of the samples, which can be numerous for high-dimensional data sets (default=FALSE).}

\item{labels}{A vector of node labels (default=\code{c("X1","X2",...)}).}

\item{save_graphviz_code}{Save the Graphviz source code in a .gv file (default=FALSE).}

\item{colorscheme}{\href{http://www.graphviz.org/doc/info/colors.html}{Graphviz color scheme} for the nodes (default="blues").}

\item{ncolors}{number of colors in the palette (default=7).}

\item{width}{An optional parameter for specifying the width of the resulting graphic in pixels.}

\item{height}{An optional parameter for specifying the height of the resulting graphic in pixels.}
}
\description{
Plots a sampled MCMC graph or an average of sampled graphs using Graphviz. \cr
In average graphs, nodes are color-coded according to importance - the proportion of samples where the node appeared in Group 1 (dark-shaded nodes appear more often).
In average graphs, thickness of edges also corresponds to importance: the proportion of samples where the edge appeared.
}
\examples{
data(madelon)
madelon_result = sbfc(madelon)
sbfc_graph(madelon_result) 
sbfc_graph(madelon_result, average=FALSE, iter=5000) # graph for 5000th iteration
sbfc_graph(madelon_result, single_noise_nodes=TRUE) # wide graph with 480 single nodes

data(heart)
heart_result = sbfc(heart)
heart_labels = c("Age", "Sex", "Chest Pain", "Rest Blood Pressure", "Cholesterol", 
"Blood Sugar", "Rest ECG", "Max Heart Rate", "Angina", "ST Depression", "ST Slope",
"Fluoroscopy Colored Vessels", "Thalassemia")
sbfc_graph(heart_result, labels=heart_labels, width=700)
}
