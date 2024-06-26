(defun run-length-encode (str)
  (let (output)
    (with-temp-buffer
      (insert str)
      (goto-char (point-min))
      (while (not (eobp))
        (let* ((char (char-after (point)))
               (count (skip-chars-forward (string char))))
          (push (format "%d%c" count char) output))))
    (mapconcat #'identity (nreverse output) "")))
