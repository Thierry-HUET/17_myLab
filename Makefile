# ============================================================
# Makefile — myLab (MyST + Docker + Git)
# ============================================================

VERSION := $(shell cat VERSION 2>/dev/null || echo "0.0.0")
DATE    := $(shell date '+%Y-%m-%d %H:%M:%S')
BRANCH  := $(shell git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "main")

.DEFAULT_GOAL := help

# ------------------------------------------------------------
# Aide
# ------------------------------------------------------------
.PHONY: help
help:
	@echo ""
	@echo "  myLab v$(VERSION) — commandes disponibles"
	@echo ""
	@echo "  Développement local"
	@echo "    make dev          Lancer le serveur MyST en mode watch"
	@echo "    make build        Compiler le site en HTML statique"
	@echo "    make clean        Supprimer le répertoire _build"
	@echo ""
	@echo "  Docker"
	@echo "    make docker-build Construire l'image Docker"
	@echo "    make docker-run   Lancer le conteneur (port 3000)"
	@echo "    make docker-stop  Arrêter et supprimer le conteneur"
	@echo ""
	@echo "  Git"
	@echo "    make commit       Ajouter, committer et pousser (message auto)"
	@echo "    make commit MSG=\"…\" Committer avec un message personnalisé"
	@echo "    make status       Afficher l'état du dépôt"
	@echo "    make log          Afficher les 10 derniers commits"
	@echo ""
	@echo "  Release"
	@echo "    make release      Tagger la version $(VERSION) et pousser"
	@echo ""

# ------------------------------------------------------------
# Développement local
# ------------------------------------------------------------
.PHONY: dev
dev:
	myst start

.PHONY: build
build:
	myst build --html

.PHONY: clean
clean:
	rm -rf _build
	@echo "  _build supprimé"

# ------------------------------------------------------------
# Docker
# ------------------------------------------------------------
IMAGE_NAME := mylab
CONTAINER_NAME := mylab-dev

.PHONY: docker-build
docker-build:
	docker build -t $(IMAGE_NAME):$(VERSION) -t $(IMAGE_NAME):latest .

.PHONY: docker-run
docker-run:
	docker run -d \
		--name $(CONTAINER_NAME) \
		-p 3000:3000 \
		-v $(PWD):/app \
		$(IMAGE_NAME):latest
	@echo "  Serveur disponible sur http://localhost:3000"

.PHONY: docker-stop
docker-stop:
	docker stop $(CONTAINER_NAME) 2>/dev/null || true
	docker rm   $(CONTAINER_NAME) 2>/dev/null || true
	@echo "  Conteneur $(CONTAINER_NAME) arrêté et supprimé"

# ------------------------------------------------------------
# Git
# ------------------------------------------------------------
MSG ?= Ajout $(DATE)

.PHONY: commit
commit:
	git add .
	git commit -m "$(MSG)"
	git push origin $(BRANCH)

.PHONY: status
status:
	git status

.PHONY: log
log:
	git log --oneline --graph --decorate -10

# ------------------------------------------------------------
# Release
# ------------------------------------------------------------
.PHONY: release
release:
	git tag -a v$(VERSION) -m "Release v$(VERSION)"
	git push origin v$(VERSION)
	@echo "  Tag v$(VERSION) poussé"
