;;; kill-file-path.el --- Copy file name into kill ring -*- lexical-binding: t -*-
;; Copyright 2022 by Adam Chyła <adam@chyla.org>

;; Author: Adam Chyła <adam@chyla.org>
;; Version: 1.0
;; Keywords: files
;; URL: https://github.com/chyla/kill-file-path/kill-file-path.el
;; Package-Requires: ((emacs "26"))

;; This program is free software: you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the
;; Free Software Foundation, either version 3 of the License, or (at your
;; option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
;; Public License for more details.
;;
;; You should have received a copy of the GNU General Public License along
;; with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; `kill-file-path.el` is a package for Emacs that provides a collection
;; of interactive commands that can be used to kill (copy)
;; buffer file name or path.

;;; Code:

(defun kill-file-path-basename ()
  "Insert the file name with extension into kill ring."
  (interactive)
  (if (not buffer-file-name)
      (message "No file for buffer.")
    (defvar file-name)
    (setq file-name (file-name-nondirectory buffer-file-name))
    (kill-new file-name)
    (message "Copied: %s" file-name)
    file-name))

(defun kill-file-path-basename-without-extension ()
  "Insert the file name without extension into kill ring."
  (interactive)
  (if (not buffer-file-name)
      (message "No file for buffer.")
    (defvar file-name)
    (setq file-name (file-name-base buffer-file-name))
    (kill-new file-name)
    (message "Copied: %s" file-name)))

(defun kill-file-path-dirname ()
  "Insert the file directory path into kill ring."
  (interactive)
  (if (not buffer-file-name)
      (message "No file for buffer.")
    (defvar file-directory)
    (setq file-directory (file-name-directory buffer-file-name))
    (kill-new file-directory)
    (message "Copied: %s" file-directory)))

(defun kill-file-path ()
  "Insert the full file path into kill ring."
  (interactive)
  (if (not buffer-file-name)
      (message "No file for buffer.")
    (kill-new buffer-file-name)
    (message "Copied: %s" buffer-file-name)))

(provide 'kill-file-path)

;;; kill-file-path.el ends here
