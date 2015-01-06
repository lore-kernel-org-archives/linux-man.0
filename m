From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH 1/2] adjtimex.2: Update return value of adjtimex
Date: Tue, 06 Jan 2015 07:34:04 +0100
Message-ID: <54AB81DC.2000308@gmail.com>
References: <1419426040-16090-1-git-send-email-standby24x7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419426040-16090-1-git-send-email-standby24x7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masanari Iida <standby24x7@gmail.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hello Masanari Iida,

On 12/24/2014 02:00 PM, Masanari Iida wrote:
> This patch update return value of adjtimex man page.
> 
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> ---
>  man2/adjtimex.2 | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
> index eb3fda1..f2a8b8c 100644
> --- a/man2/adjtimex.2
> +++ b/man2/adjtimex.2
> @@ -109,12 +109,13 @@ returns the clock state:
>  .PP
>  .in +4n
>  .nf
> -#define TIME_OK   0 /* clock synchronized */
> -#define TIME_INS  1 /* insert leap second */
> -#define TIME_DEL  2 /* delete leap second */
> -#define TIME_OOP  3 /* leap second in progress */
> -#define TIME_WAIT 4 /* leap second has occurred */
> -#define TIME_BAD  5 /* clock not synchronized */
> +#define TIME_OK    0 /* clock synchronized */
> +#define TIME_INS   1 /* insert leap second */
> +#define TIME_DEL   2 /* delete leap second */
> +#define TIME_OOP   3 /* leap second in progress */
> +#define TIME_WAIT  4 /* leap second has occurred */
> +#define TIME_ERROR 5 /* clock not synchronized */
> +#define TIME_BAD   TIME_ERROR /* bw compat */
>  .fi
>  .in
>  .PP

Thanks for your patch. Because of other recent changes to the page,
it does not apply, but I instead applied the patch below. Does
that look okay to you?

Thanks,

Michael

diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
index 4b558b7..644e39b 100644
--- a/man2/adjtimex.2
+++ b/man2/adjtimex.2
@@ -305,8 +305,13 @@ Leap second in progress.
 .BR TIME_WAIT
 Leap second has occurred.
 .TP
-.BR TIME_BAD
+.BR TIME_ERROR
 Clock not synchronized.
+The symbolic name
+.B TIME_BAD
+is a synonym for
+.BR TIME_ERROR ,
+provided for backward comaptibility.
 .PP
 On failure,
 .BR adjtimex ()




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
