From: Vincent Lefevre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org>
Subject: missing "restrict" in various prototypes
Date: Tue, 14 Feb 2017 15:15:28 +0100
Message-ID: <20170214141528.GC16063@cventin.lip.ens-lyon.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://man7.org/linux/man-pages/man3/strtoimax.3.html contains:

    intmax_t strtoimax(const char *nptr, char **endptr, int base);
    uintmax_t strtoumax(const char *nptr, char **endptr, int base);

However the correct prototypes according to the C99 and C11 standards
are:

    intmax_t strtoimax(const char * restrict nptr,
        char ** restrict endptr, int base);
    uintmax_t strtoumax(const char * restrict nptr,
        char ** restrict endptr, int base);

i.e. the "restrict" is missing for all pointers.

This seems to be an error only in the man page. The glibc 2.19 manual
gives the correct prototypes:

 -- Function: intmax_t strtoimax (const char *restrict STRING, char
          **restrict TAILPTR, int BASE)

 -- Function: uintmax_t strtoumax (const char *restrict STRING, char
          **restrict TAILPTR, int BASE)

and /usr/include/inttypes.h is correct too:

extern intmax_t strtoimax (const char *__restrict __nptr,
                           char **__restrict __endptr, int __base) __THROW;

extern uintmax_t strtoumax (const char *__restrict __nptr,
                            char ** __restrict __endptr, int __base) __THROW;

Similarly, http://man7.org/linux/man-pages/man3/wcstoimax.3.html
contains:

    intmax_t wcstoimax(const wchar_t *nptr, wchar_t **endptr, int base);
    uintmax_t wcstoumax(const wchar_t *nptr, wchar_t **endptr, int base);

while it should be:

    intmax_t wcstoimax(const wchar_t * restrict nptr,
        wchar_t ** restrict endptr, int base);
    uintmax_t wcstoumax(const wchar_t * restrict nptr,
        wchar_t ** restrict endptr, int base);

Ditto for some prototypes in:
  http://man7.org/linux/man-pages/man3/strtod.3.html
  http://man7.org/linux/man-pages/man3/strtol.3.html
  http://man7.org/linux/man-pages/man3/strtoul.3.html
  http://man7.org/linux/man-pages/man3/mbtowc.3.html
  http://man7.org/linux/man-pages/man3/mbstowcs.3.html
  http://man7.org/linux/man-pages/man3/wcstombs.3.html
  http://man7.org/linux/man-pages/man3/memcpy.3.html
  http://man7.org/linux/man-pages/man3/strcpy.3.html
  http://man7.org/linux/man-pages/man3/strcat.3.html
  http://man7.org/linux/man-pages/man3/printf.3.html
  http://man7.org/linux/man-pages/man3/scanf.3.html
etc.

Ditto for (this time POSIX only):
  http://man7.org/linux/man-pages/man3/realpath.3.html

-- 
Vincent Lefèvre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org> - Web: <https://www.vinc17.net/>
100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
Work: CR INRIA - computer arithmetic / AriC project (LIP, ENS-Lyon)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
