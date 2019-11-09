;; Teria que criar um conceito de workspaces. Então você pode criar vários
;; workspaces e alternar entre eles. Exemplo:

;; Você está programando javascript, então você chama a função:
(noloop-buffer-manager-add-workspace "js" "/my/path" t)
;; o segundo argumento serve para abrir o neotree:
(neotree-dir "/my/path")
;; e t irá ativar esse workspace como current:
(setq *noloop-buffer-manager-current-workspace* "js")
;; Assim todos os buffers que você adicionar irão ser adiconados numa lista
;; nesse worspace de nome "js".

;; abaixo pode ser um optional "js" ou current-buffer
(noloop-buffer-manager-add-buffer "js")
(noloop-buffer-manager-remove-buffer "js") 
(noloop-buffer-manager-next-buffer "js")
(noloop-buffer-manager-previus-buffer "js")

;; controlar os buffers do next dp emacs:
(noloop-buffer-manager-load-next-buffers "js")
;; isso carregará os buffers no next salvos, e todos novos que forem
;; criados irá para esse workspace, para isso você terá que concectar
;; o next com o slime e dar algum jeito de uma função emacs conseguir
;; chamar uma função no slime.

;; funções uteis que serão mostardas em *noloop-buffer-manager*
(noloop-buffer-manager-list-workspaces)
(noloop-buffer-manager-list-buffers "js")
(noloop-buffer-manager-list-next-buffers "js")

(provide 'noloop-buffer-manager)
