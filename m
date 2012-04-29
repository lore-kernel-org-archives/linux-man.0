From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mallopt.3: fix program source to match behaviour example
Date: Mon, 30 Apr 2012 06:47:30 +1200
Message-ID: <CAKgNAki--sA=pfczWjwU=4GQbP+nZBqDCHfScmf3E4o_Kp8ing@mail.gmail.com>
References: <1335701271-10490-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335701271-10490-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Apr 30, 2012 at 12:07 AM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>=
 wrote:
> Call mallopt with argv[1] only if a parameter is given
> ---
> =A0man3/mallopt.3 | =A0 =A08 ++++----
> =A01 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/man3/mallopt.3 b/man3/mallopt.3
> index ddb1aed..03f1e9a 100644
> --- a/man3/mallopt.3
> +++ b/man3/mallopt.3
> @@ -543,11 +543,11 @@ main(int argc, char *argv[])
> =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "%s <M_CHECK_ACTION\-value>\\=
n", argv[0]);
> =A0 =A0 =A0 =A0 =A0 =A0 exit(EXIT_FAILURE);
> =A0 =A0 =A0 =A0 }
> - =A0 =A0}
>
> - =A0 =A0if (mallopt(M_CHECK_ACTION, atoi(argv[1])) !=3D 1) {
> - =A0 =A0 =A0 =A0fprintf(stderr, "mallopt() failed");
> - =A0 =A0 =A0 =A0exit(EXIT_FAILURE);
> + =A0 =A0 =A0 =A0if (mallopt(M_CHECK_ACTION, atoi(argv[1])) !=3D 1) {
> + =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, "mallopt() failed");
> + =A0 =A0 =A0 =A0 =A0 =A0exit(EXIT_FAILURE);
> + =A0 =A0 =A0 =A0}
> =A0 =A0 }
>
> =A0 =A0 p =3D malloc(1000);
> --

Hi Simon,

Thanks for this. Somewhere along the way I included the wrong source
in the EXAMPLE section. However, the intended code was as per this
patch:

=3D=3D
--- a/man3/mallopt.3
+++ b/man3/mallopt.3
@@ -540,17 +540,12 @@ main(int argc, char *argv[])
     char *p;

     if (argc > 1) {
-        if (argc !=3D 2) {
-            fprintf(stderr, "%s <M_CHECK_ACTION\-value>\\n", argv[0]);
+        if (mallopt(M_CHECK_ACTION, atoi(argv[1])) !=3D 1) {
+            fprintf(stderr, "mallopt() failed");
             exit(EXIT_FAILURE);
         }
     }

-    if (mallopt(M_CHECK_ACTION, atoi(argv[1])) !=3D 1) {
-        fprintf(stderr, "mallopt() failed");
-        exit(EXIT_FAILURE);
-    }
-
     p =3D malloc(1000);
     if (p =3D=3D NULL) {
         fprintf(stderr, "malloc() failed");
=3D=3D

The complete example is shown below. I've applied the above patch.

Cheers,

Michael

=3D=3D=3D=3D=3D

#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>

int
main(int argc, char *argv[])
{
    char *p;

    if (argc > 1) {
        if (mallopt(M_CHECK_ACTION, atoi(argv[1])) !=3D 1) {
            fprintf(stderr, "mallopt() failed");
            exit(EXIT_FAILURE);
        }
    }

    p =3D malloc(1000);
    if (p =3D=3D NULL) {
        fprintf(stderr, "malloc() failed");
        exit(EXIT_FAILURE);
    }

    free(p);
    printf("main(): returned from first free() call\n");

    free(p);
    printf("main(): returned from second free() call\n");

    exit(EXIT_SUCCESS);
}


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
