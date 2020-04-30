(TeX-add-style-hook
 "cv-decathlon"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "french")))
   (TeX-run-style-hooks
    "latex2e"
    "common/info-perso"
    "farangoth-cv"
    "farangoth-cv10"
    "babel"
    "lipsum")
   (TeX-add-symbols
    "cvTitle")
   (LaTeX-add-labels
    "sec:about"))
 :latex)

