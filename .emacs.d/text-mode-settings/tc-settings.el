(defvar tc-add-used-defines-or-functions-begin-name "// begin insert defines" "insert tc defines or functions after this string")
(defvar tc-add-used-defines-or-functions-end-name "// end insert defines" "insert tc defines or functions after this string")
(defvar tc-defines-or-functions-table )

(setq tc-add-used-defines-or-functions-begin-name "// begin insert defines")
(setq tc-add-used-defines-or-functions-end-name "// end insert defines")
(setq tc-defines-or-functions-table
      (list
       (list "ll" "typedef long long ll;")
       (list "ull" "typedef unsigned long long ull;")
       (list "u32" "typedef unsigned int u32;")
       (list "VR<" "#define VR vector")
       (list "VRI" "typedef vector<int> VRI;")
       (list "VRS" "typedef vector<string> VRS;")
       (list "PB(" "#define PB push_back")
       (list "MP(" "#define MP make_pair")
       (list ".FS" "#define FS first")
       (list ".ND" "#define ND second")
       (list "CR(" "#define CR clear")
       (list "sqr(" "template <class T> inline T sqr(T x) {return x * x;}")
       (list "lowbit(" "template <class T> inline T lowbit(T x) {return x & -x;}")
       (list "Pt" "typedef complex<double> Pt;\n\
#define X real()\n\
#define Y imag()")
       (list "PtL" "typedef complex<long long> PtL;")
       (list "gmin(" "template <class T> inline void gmin (T &a, T b) {if (b < a) a = b;}")
       (list "gmax(" "template <class T> inline void gmax (T &a, T b) {if (a < b) a = b;}")
       (list "PV(" "template <class T> void PV(T x) {for(__typeof__((x).begin()) i = (x).begin(); i != (x).end(); ++i) cout << *i << \" \"; cout << endl;}")
       (list "PA(" "template <class T> void PA(T x[], int n) {for (int i = 0; i < n; ++i) cout << x[i] << \" \"; cout << endl;}")
       (list "_ceil_div" "template<class A, class B> A _ceil_div(A a, B b){return (abs(a) + abs(b) - 1) / b * (a > 0 ? 1 : -1);}")
       (list "Rep(" "#define Rep(i,n) for(int n_ = (n), i = 0; i< n_; ++i)")
       (list "forI(" "#define forI(it,v) for(__typeof__((v).begin()) it = (v).begin(); it != (v).end(); ++it)")
       (list "forE(" "#define forE(elem,v) \
 for(__typeof__(v.begin()) _it = v.begin(); _it != v.end();++_it) \
for(int _once=1, _done=0; _once; (!_done) ? (_it=v.end(), --_it) :_it ) \
for(__typeof__(*_it) & elem = * _it; _once && !(_once=0); _done=1)")
       (list "DBG(" "#define DBG(a) cerr << #a << \": \" << (a) << endl")
       (list "ALL(" "#define ALL(a) (a).begin(),(a).end()")
       (list "two(" "#define two(x) (1u<<(x))")
       (list "twoL(" "#define twoL(x) (1LLU<<(x))")
       (list "PII" "typedef pair<int, int> PII;")
       (list "PLL" "typedef pair<long long, long long> PLL;")
       (list "PR" "#define PR pair\n\
template<typename S, typename T> ostream& operator<<(ostream& os, pair<S,T> p){ return os << \"(\" << p.first << \",\" << p.second << \")\"; };")
       
       (list "gen_prime" "int prime[P], pn;
bool is_prime[P];

void gen_prime()
{
  fill(is_prime + 2, is_prime + P, true);
  for (int i = 2; i < P; ++i) {
    if (is_prime[i]) prime[pn++] = i;
    for (int j = 0; j < pn && prime[j] * i < P; ++j) {
      is_prime[prime[j] * i] = false;
      if (i % prime[j] == 0) break;
    }
  }
}")
       (list "Bit" "void Bit(int x, int len = 4, int b = 2) {
  vector<int> v;
  while (x) {
    v.push_back(x % b);
    x /= b;
  }
  while ((int)v.size() < len) v.push_back(0);
  for (size_t i = 0; i < v.size(); ++i)
    cout << v[i];
  cout << endl;
}")
       ))

(defun tc-add-used-defines-or-functions()
  "Add used defines or functions to current buffer."
  (interactive())
  (let ((cur-point (point))
        (begin-name tc-add-used-defines-or-functions-begin-name)
        (end-name tc-add-used-defines-or-functions-end-name)
        (table tc-defines-or-functions-table))
    (setq case-fold-search nil)
    (while table
      (let ((abbrv (car (car table)))
            (expand (car (cdr (car table)))))
        (progn
          (beginning-of-buffer)
          (search-forward end-name)
          (if (not (search-backward expand (point-min) t))
              (progn (beginning-of-buffer)
                     (search-forward end-name)
                     (if (search-forward abbrv (point-max) t)
                         (progn (beginning-of-buffer)
				;;                                (fancy-message abbrv)
                                (search-forward begin-name)
                                (move-end-of-line nil)
                                (insert "\n")
                                (insert expand)
                                (setq cur-point (+ cur-point (string-bytes expand)))
                                (setq cur-point (+ cur-point 1))))))))
      (setq table (cdr table)))
    (setq case-fold-search t)
    (goto-char cur-point)))

;; (add-hook 'c++-mode-hook (lambda () (define-key c++-mode-map (kbd "C-S-t") 'tc-add-used-defines-or-functions)))

(provide 'tc-settings)
