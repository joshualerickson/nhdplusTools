% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_oaproc.R
\name{get_xs_point}
\alias{get_xs_point}
\title{Get Cross Section From Point (experimental)}
\usage{
get_xs_point(point, width, num_pts)
}
\arguments{
\item{point}{sfc POINT including crs as created by:
\code{sf::st_sfc(sf::st_point(.. ,..), crs)}crs.}

\item{width}{Cross section width in meters.}

\item{num_pts}{numeric number of points to retrieve along the cross section.}
}
\value{
sf data.frame containing points retrieved.
}
\description{
Uses a cross section retrieval web services to retrieve a
cross section given a point and specified width. Orientation is determined
based on direction of a the flowline found near point. This function uses
a 10m Natioinal Elevation Dataset request on the back end.
}
\examples{
\donttest{
point <- sf::st_sfc(sf::st_point(x = c(-105.97218, 36.17592)), crs = 4326)

(xs <- get_xs_point(point, 300, 100))

bbox <- sf::st_bbox(xs) + c(-0.005, -0.005, 0.005, 0.005)

nhdplusTools::plot_nhdplus(bbox = bbox)

plot(sf::st_transform(sf::st_geometry(xs), 3857), pch = ".", add = TRUE, col = "red")
plot(sf::st_transform(sf::st_sfc(point, crs = 4326), 3857), add = TRUE)

plot(xs$distance_m, xs$elevation_m)

}

}
