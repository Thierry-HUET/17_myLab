FROM --platform=$BUILDPLATFORM python:3 AS builder
RUN apt update && apt -qy upgrade
