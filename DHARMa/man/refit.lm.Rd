% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulateResiduals.R
\name{refit.lm}
\alias{refit.lm}
\title{Refit a Model with a Different Response}
\usage{
\method{refit}{lm}(object, newresp, ...)
}
\arguments{
\item{object}{a fitted model}

\item{newresp}{a new response}

\item{...}{further arguments, no effect implemented for this S3 class}
}
\description{
Refit a Model with a Different Response
}
\examples{
testData = createData(sampleSize = 200, family = poisson())

# examples of refit with different model classes
library(lme4)
library(mgcv)
library(glmmTMB)

fittedModel <- lm(observedResponse ~ Environment1 , data = testData)
newResponse = simulate(fittedModel)
refit(fittedModel, newResponse[,1])

fittedModel <- glm(observedResponse ~ Environment1 , data = testData, family = "poisson")
newResponse = simulate(fittedModel)
refit(fittedModel, newResponse[,1])

fittedModel <- mgcv::gam(observedResponse ~ s(Environment1) , data = testData, family = "poisson")
newResponse = simulate(fittedModel)
refit(fittedModel, newResponse[,1])

fittedModel <- lme4::lmer(observedResponse ~ Environment1 + (1|group) , data = testData)
newResponse = simulate(fittedModel)
refit(fittedModel, newResponse[,1])

fittedModel <- lme4::glmer(observedResponse ~ Environment1 + (1|group) , data = testData, 
                           family = "poisson")
newResponse = simulate(fittedModel)
refit(fittedModel, newResponse[,1])

fittedModel <- glmmTMB::glmmTMB(observedResponse ~ Environment1 + (1|group) , data = testData)
newResponse = simulate(fittedModel)
refit(fittedModel, newResponse[,1])
}
