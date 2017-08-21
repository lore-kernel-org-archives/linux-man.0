From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCTH 0/2] pthread_mutexattr_setrobust() and pthread_mutex_consistent()
Date: Mon, 21 Aug 2017 10:30:01 +0800
Message-ID: <CAJYFCiMsHf6Wrhq1_w32JrQx_Yy2F1hbdTuJ8XD_imJBThPUgQ@mail.gmail.com>
References: <CAJYFCiMZN09HaHpvKgxz3mqzmcaXAWmkz=BmgOW9WVdRKOhDsg@mail.gmail.com>
 <CAJYFCiPP54qAKdBswWuu-1Ms60KLoY7X=k5Lva5pXSYWFaks3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="f403045c809e82af3305573a417f"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJYFCiPP54qAKdBswWuu-1Ms60KLoY7X=k5Lva5pXSYWFaks3Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

--f403045c809e82af3305573a417f
Content-Type: text/plain; charset="UTF-8"

Here are the man page in plain text, in case you want to read it
directly in the email.

FYI, I obtain information about these API mainly from reading the
source and testing. If you find anything wrong, please kindly reply
and point it out.

Many thanks!
Yubin

--- pthread_mutexattr_setrobust() and pthread_mutexattr_getrobust() ---

Name
  pthread_mutexattr_getrobust, pthread_mutexattr_setrobust,
  pthread_mutexattr_getrobust_np, pthread_mutexattr_setrobust_np

  -- get and set the robustness attribute of a mutex attribute object

SYNOPSIS
  #include <pthread.h>

 int pthread_mutexattr_getrobust(const pthread_mutexattr_t *attr, int
*robustness);
 int pthread_mutexattr_setrobust(const pthread_mutexattr_t *attr, int
*robustness);
 int pthread_mutexattr_getrobust_np(const pthread_mutexattr_t *attr,
int *robustness);
 int pthread_mutexattr_setrobust_np(const pthread_mutexattr_t *attr,
int *robustness);

  Compile and link with -pthread.

DESCRIPTION
  The pthread_mutexattr_getrobust() and pthread_mutexattr_setrobust() functions
  get and set the robustness attribute of a initialized mutex attribute object,
  respectively. The robustness attribute specify the behavior of the mutex when
  its owner dies without unlocking it. These two functions are
specified in POSIX.
  Glibc's NPTL has pthread_mutexattr_getrobust_np() and
pthread_mutexattr_setrobust_np()
  respectively but they are just aliases, with the "np" standing for
"Native Posix".
  See NPTL(7).

  Currently there are only two possible values for the robustness attribute:

  PTHREAD_MUTEX_STALLED is the default value for a mutex attribute object. If a
  mutex is initialized with a PTHREAD_MUTEX_STALLED attribute object and its
  owner dies without unlocking it, it is kept locked afterwards and any future
  attempts to call pthread_mutex_lock() on this mutex will block indefinitely.

  PTHREAD_MUTEX_ROBUST can be set on a mutex attribute object so that when the
  owner of the mutex dies or when the process containing such a locked mutex
  performs execve(2), any future attempts to call pthread_mutex_lock() on this
  mutex will suceed and return EOWNERDEAD to indicate that the original owner no
  longer exists and the mutex is left in an inconsisten state. After EOWNERDEAD
  is returned, the next owner should call pthread_mutex_consistent(3) on the
  acquired mutex to make it consistent again before using it any further. If the
  next owner calls pthread_mutex_unlock(3) before making it consistent, the
  mutex will be unusable permanently and any subsequent attempts to
lock it using
  pthread_mutex_lock(3) will return ENORECOVERABLE. If the next owner terminates
  before calling pthread_mutex_consistent(3), furture pthread_mutex_lock(3) on
  this mutex will still return EOWNERDEAD.

  Glibc defined PTHREAD_MUTEX_STALLED_NP and PTHREAD_MUTEX_ROBUST_NP as aliases
  of PTHREAD_MUTEX_STALLED and PTHREAD_MUTEX_ROBUST respectively.

  Note that the *attr* argument of pthread_mutexattr_getrobust() and
  pthread_mutexattr_setrobust() should refer to a mutex attribute object that
  was initialized by pthread_mutexattr_init(3), otherwise the behavior is
  undefined.

RETURN VALUE
  On success, zero is returned by pthread_mutexattr_getrobust() and the value
  pointed to by the *robustness* parameter is set to the robustness attribute
  of *attr*. Otherwise, an error number shall be returned. On success
  pthread_mutexattr_setrobust() set the robustness attribute into the mutex
  attribute object *attr* and return zero, otherwise a error number is returned
  to indicate the error.

  [Glibc-specificed features]
  In glibc's implementation, pthread_mutexattr_getrobust() always return zero.

ERRORS

  EINVAL A value other than PTHREAD_MUTEX_STALLED or PTHREAD_MUTEX_ROBUST is
  passed into pthread_mutexattr_setrobust().

EXAMPLES

    #include <stdio.h>
    #include <unistd.h>
    #include <pthread.h>
    #include <errno.h>

    pthread_mutex_t lock;

    void *original_owner_thread(void *ptr)
    {
        printf("[original owner] Setting lock...\n");
        pthread_mutex_lock(&lock);
        printf("[original owner] Locked. Now exiting without unlocking.\n");
        pthread_exit(NULL);
    }

    int main(int argc, char *argv[])
    {
        pthread_t lock_getter;
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);   /* initialize the attribute object */
        pthread_mutexattr_setrobust(&attr, PTHREAD_MUTEX_ROBUST); /*
set robustness */

        pthread_mutex_init(&lock, &attr);   /* initialize the lock */

        pthread_create(&lock_getter, NULL, original_owner_thread, NULL);
        sleep(2);   /* original_owner_thread should have exited now */

        printf("Attempting to acquire unlock robust mutex.\n");
        int ret_code = pthread_mutex_lock(&lock);
        if(EOWNERDEAD == ret_code) {
            printf("EOWNERDEAD returned. Make the mutex consistent now\n");
            pthread_mutex_consistent(&lock);
        }

        pthread_mutex_unlock(&lock);

        return 0;
    }


SEE ALSO
    pthread_mutexattr_init(3), pthread_mutex_consistent(3),
    pthread_mutex_lock(3)

--- END ---

--- pthread_mutex_consistent() ---

NAME
    pthread_mutex_consistent - make the robust mutex consistent

SYNOPSIS
    #include <pthread.h>
    int pthread_mutex_consistent(pthread_mutex_t *mutex)

    Compile and link with -pthread.

DESCRIPTION
    This function make a robust mutex consistent if it is in a inconsistent
    state. A mutex can be left in a inconsistent state if its owner terminate
    while holding the mutex, in which situation the next owner who acquire the
    mutex will succeed and be notified by the return value of EOWNERDEAD.

RETURN VALUE
    On success, pthread_mutex_consistent() return 0. Otherwise an error value
    is returned to indicate the error.

ERRORS
    EINVAL The mutex is either not robust or is not in a inconsistent state.

SEE ALSO
    pthread_mutex_lock(3), pthread_mutexattr_init(3),
    pthread_mutexattr_setrobust(3), pthread_mutexattr_getrobust(3)


---- END ---

--f403045c809e82af3305573a417f
Content-Type: text/x-csrc; charset="US-ASCII"; name="verify_robustness.1.c"
Content-Disposition: attachment; filename="verify_robustness.1.c"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j6lyfpsp0

LyoKICogVGhpcyBwcm9ncmFtIGlzIHVzZWQgdG8gdmVyaWZ5IHRoYXQgd2hlbiB0aGUgb3duZXIg
b2YgYSBub24tcm9idXN0IGxvY2sgZXhpdAogKiBwcmVtYXR1cmVseSB3aXRob3V0IHVubG9ja2lu
ZyB0aGUgbXV0ZXgsIHRoZSBuZXh0IG93bmVyIHdpbGwgYmUgYmxvY2sKICogaW5kZWZpbnRlbHku
CiAqCiAqIENvbXBpbGUgYW5kIGxpbmsgd2l0aCAtcHRocmVhZAogKi8KCiNpbmNsdWRlIDxzdGRp
by5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxwdGhyZWFkLmg+CiNpbmNsdWRlIDxl
cnJuby5oPgoKcHRocmVhZF9tdXRleF90IGxvY2s7Cgp2b2lkICpvcmlnaW5hbF9vd25lcl90aHJl
YWQodm9pZCAqcHRyKQp7CiAgICBwcmludGYoIltvcmlnaW5hbCBvd25lcl0gU2V0dGluZyBsb2Nr
Li4uXG4iKTsKICAgIHB0aHJlYWRfbXV0ZXhfbG9jaygmbG9jayk7CiAgICBwcmludGYoIltvcmln
aW5hbCBvd25lcl0gTG9ja2VkLiBOb3cgZXhpdGluZyB3aXRob3V0IHVubG9ja2luZy5cbiIpOwog
ICAgcHRocmVhZF9leGl0KE5VTEwpOwp9CgppbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltd
KSAKewogICAgcHRocmVhZF90IGxvY2tfZ2V0dGVyOwogICAgcHRocmVhZF9tdXRleGF0dHJfdCBh
dHRyOwogICAgcHRocmVhZF9tdXRleGF0dHJfaW5pdCgmYXR0cik7ICAgLyogaW5pdGlhbGl6ZSB0
aGUgYXR0cmlidXRlIG9iamVjdCAqLwogICAgcHRocmVhZF9tdXRleGF0dHJfc2V0cm9idXN0KCZh
dHRyLCBQVEhSRUFEX01VVEVYX1JPQlVTVCk7CgogICAgcHRocmVhZF9tdXRleF9pbml0KCZsb2Nr
LCAmYXR0cik7ICAgLyogaW5pdGlhbGl6ZSB0aGUgbG9jayAqLwoKICAgIHB0aHJlYWRfY3JlYXRl
KCZsb2NrX2dldHRlciwgTlVMTCwgb3JpZ2luYWxfb3duZXJfdGhyZWFkLCBOVUxMKTsKICAgIHNs
ZWVwKDIpOyAgIC8qIG9yaWdpbmFsX293bmVyX3RocmVhZCBzaG91bGQgaGF2ZSBleGl0ZWQgbm93
ICovCgogICAgcHJpbnRmKCJBdHRlbXB0aW5nIHRvIGFjcXVpcmUgdW5sb2NrIHJvYnVzdCBtdXRl
eC5cbiIpOwogICAgaW50IHJldF9jb2RlID0gcHRocmVhZF9tdXRleF9sb2NrKCZsb2NrKTsKICAg
IGlmKEVPV05FUkRFQUQgPT0gcmV0X2NvZGUpIHsKICAgICAgICBwcmludGYoIkVPV05FUkRFQUQg
cmV0dXJuZWQuIE1ha2UgdGhlIG11dGV4IGNvbnNpc3RlbnQgbm93XG4iKTsKICAgICAgICBwdGhy
ZWFkX211dGV4X2NvbnNpc3RlbnQoJmxvY2spOwogICAgfQoKICAgIHB0aHJlYWRfbXV0ZXhfdW5s
b2NrKCZsb2NrKTsKCiAgICByZXR1cm4gMDsKfQo=
--f403045c809e82af3305573a417f
Content-Type: text/x-csrc; charset="US-ASCII"; name="verify_robustness.2.c"
Content-Disposition: attachment; filename="verify_robustness.2.c"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j6lyfpt31

LyoKICogVGhpcyBwcm9ncmFtIGlzIHVzZWQgdG8gdmVyaWZ5IHRoYXQgd2hlbiB0aGUgb3duZXIg
b2YgYSBub24tcm9idXN0IGxvY2sgZXhpdAogKiBwcmVtYXR1cmVseSB3aXRob3V0IHVubG9ja2lu
ZyB0aGUgbXV0ZXgsIHRoZSBuZXh0IG93bmVyIHdpbGwgYmUgYmxvY2sKICogaW5kZWZpbnRlbHku
CiAqLwoKI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPHB0
aHJlYWQuaD4KI2luY2x1ZGUgPGVycm5vLmg+CgpwdGhyZWFkX211dGV4X3QgbG9jazsKCnZvaWQg
Km9yaWdpbmFsX293bmVyX3RocmVhZCh2b2lkICpwdHIpCnsKICAgIHByaW50ZigiW29yaWdpbmFs
IG93bmVyXSBTZXR0aW5nIGxvY2suLi5cbiIpOwogICAgcHRocmVhZF9tdXRleF9sb2NrKCZsb2Nr
KTsKICAgIHByaW50ZigiW29yaWdpbmFsIG93bmVyXSBMb2NrZWQuIE5vdyBleGl0aW5nIHdpdGhv
dXQgdW5sb2NraW5nLlxuIik7CiAgICBwdGhyZWFkX2V4aXQoTlVMTCk7Cn0KCmludCBtYWluKGlu
dCBhcmdjLCBjaGFyICphcmd2W10pIAp7CiAgICBwdGhyZWFkX3QgbG9ja19nZXR0ZXI7CiAgICBw
dGhyZWFkX211dGV4YXR0cl90IGF0dHI7CiAgICBwdGhyZWFkX211dGV4YXR0cl9pbml0KCZhdHRy
KTsgICAvKiBpbml0aWFsaXplIHRoZSBhdHRyaWJ1dGUgb2JqZWN0ICovCiAgICAvKiB0aGUgZm9s
bG93aW5nIGxpbmUgY2FuIGJlIGNvbW1lbnRlZCBvdXQgYmVjYXVzZSBQVEhSRUFEX01VVEVYX1NU
QUxMRUQgaXMKICAgICAqIHRoZSBkZWZhdWx0IHZhbHVlIGZvciBhIG11dGV4IGF0dHJpYnV0ZSBv
YmplY3QgKi8KICAgIHB0aHJlYWRfbXV0ZXhhdHRyX3NldHJvYnVzdCgmYXR0ciwgUFRIUkVBRF9N
VVRFWF9TVEFMTEVEKTsKCiAgICBwdGhyZWFkX211dGV4X2luaXQoJmxvY2ssICZhdHRyKTsgICAv
KiBpbml0aWFsaXplIHRoZSBsb2NrICovCgogICAgcHRocmVhZF9jcmVhdGUoJmxvY2tfZ2V0dGVy
LCBOVUxMLCBvcmlnaW5hbF9vd25lcl90aHJlYWQsIE5VTEwpOwogICAgc2xlZXAoMik7ICAgLyog
b3JpZ2luYWxfb3duZXJfdGhyZWFkIHNob3VsZCBoYXZlIGV4aXRlZCBub3cgKi8KCiAgICBwcmlu
dGYoIkF0dGVtcHRpbmcgdG8gYWNxdWlyZSB1bmxvY2sgcm9idXN0IG11dGV4LlxuIik7CiAgICBp
bnQgcmV0X2NvZGUgPSBwdGhyZWFkX211dGV4X2xvY2soJmxvY2spOwogICAgaWYoRU9XTkVSREVB
RCA9PSByZXRfY29kZSkgewogICAgICAgIHByaW50ZigiRU9XTkVSREVBRCByZXR1cm5lZC4gTWFr
ZSB0aGUgbXV0ZXggY29uc2lzdGVudCBub3dcbiIpOwogICAgICAgIHB0aHJlYWRfbXV0ZXhfY29u
c2lzdGVudCgmbG9jayk7CiAgICB9CgogICAgcHRocmVhZF9tdXRleF91bmxvY2soJmxvY2spOwoK
ICAgIHJldHVybiAwOwp9Cg==
--f403045c809e82af3305573a417f--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
