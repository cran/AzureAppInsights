% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/include_snippet.R
\name{startAzureAppInsights}
\alias{startAzureAppInsights}
\alias{includeAzureAppInsights}
\title{Include and run Azure Application Insights for web pages}
\usage{
startAzureAppInsights(
  session,
  cfg,
  instance.name = "appInsights",
  ld = 0,
  useXhr = TRUE,
  crossOrigin = "anonymous",
  onInit = NULL,
  heartbeat = 3e+05,
  extras = list(),
  include.ip = FALSE,
  cookie.user = FALSE,
  debug = FALSE
)

includeAzureAppInsights(version = c("2.8.14", "2.7.0"))
}
\arguments{
\item{session}{The \code{session} object passed to function given to \code{shinyServer}.}

\item{cfg}{List-object from \code{\link{config}}.}

\item{instance.name}{Global JavaScript Instance name defaults to "appInsights" when not supplied. \emph{NOT} the app's name. Used for accessing the instance from other JavaScript routines.}

\item{ld}{Defines the load delay (in ms) before attempting to load the sdk. -1 = block page load and add to head. (default) = 0ms load after timeout,}

\item{useXhr}{Logical, use XHR instead of fetch to report failures (if available).}

\item{crossOrigin}{When supplied this will add the provided value as the cross origin attribute on the script tag.}

\item{onInit}{Once the application insights instance has loaded and initialized this callback function will be called with 1 argument -- the sdk instance}

\item{heartbeat}{Integer, how often should the heartbeat beat -- or set to \code{FALSE} to disable.}

\item{extras}{(Named) list of values to add to any tracking.}

\item{include.ip}{Logical, adds \code{ip} to all tracking's \code{customDimension}. See note.}

\item{cookie.user}{Logical, when \code{TRUE} sets a cookie with a random string and submits this
along with any tracking with the key \code{userid}.}

\item{debug}{Logical, JS loader uses \code{console.log}.}

\item{version}{Version of the Application Insights JavaScript SDK to load.}
}
\value{
Methods sends data to client's browser; returns the sent list, invisibly.
}
\description{
Include the JS snippet in your \code{ui}-function with \code{includeAzureAppInsights}
and start the tracking with \code{startAzureAppInsights} in your \code{server}-function.
}
\section{Tracking users' ip-address}{

Generally, Azure's Application Insight does not collect the users' ip-address,
due to it being somewhat sensitive data (\href{https://learn.microsoft.com/en-us/azure/azure-monitor/app/ip-collection?tabs=net}{link}).

\code{\link{startAzureAppInsights}} however has the argument `include.ip` which,
when set to \code{TRUE}, will add the entry \code{ip} to all trackings.
The tracked ip-address is taken from \code{session$request$REMOTE_ADDR},
which is an un-documented feature and may or may not be the users ip-address.
}

\references{
https://docs.microsoft.com/en-us/azure/azure-monitor/app/javascript
and
https://github.com/microsoft/ApplicationInsights-JS
and
https://learn.microsoft.com/en-us/azure/azure-monitor/app/ip-collection?tabs=net
}
