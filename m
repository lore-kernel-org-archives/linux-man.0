From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH 2/2] adjtimex.2: Update modes field of adjtimex
Date: Tue, 06 Jan 2015 07:45:20 +0100
Message-ID: <54AB8480.5060603@gmail.com>
References: <1419426040-16090-1-git-send-email-standby24x7@gmail.com> <1419426040-16090-2-git-send-email-standby24x7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419426040-16090-2-git-send-email-standby24x7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masanari Iida <standby24x7@gmail.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 12/24/2014 02:00 PM, Masanari Iida wrote:
> This patch update modes field of adjtimex man page.

Hello Masanari Iida,

Thanks for this patch. As it happened, some other
recent changes to the page covered the same changes
already, so this patch is obsolete. You can find the no
current version in Git (see
http://git.kernel.org/cgit/docs/man-pages/man-pages.git/tree/man2/adjtimex.2
)

Cheers,

Michael


> 
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> ---
>  man2/adjtimex.2 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
> index f2a8b8c..b4450e8 100644
> --- a/man2/adjtimex.2
> +++ b/man2/adjtimex.2
> @@ -92,8 +92,15 @@ combination of zero or more of the following bits:
>  #define ADJ_ESTERROR          0x0008 /* estimated time error */
>  #define ADJ_STATUS            0x0010 /* clock status */
>  #define ADJ_TIMECONST         0x0020 /* pll time constant */
> +#define ADJ_TAI               0x0080 /* set TAI offset */
> +#define ADJ_SETOFFSET         0x0100 /* add 'time' to current time */
> +#define ADJ_MICRO             0x1000 /* select microsecond
> +                                        resolution */
> +#define ADJ_NANO              0x2000 /* select nanosecond
> +                                        resolution */
>  #define ADJ_TICK              0x4000 /* tick value */
> -#define ADJ_OFFSET_SINGLESHOT 0x8001 /* old-fashioned adjtime() */
> +#define ADJ_OFFSET_SINGLESHOT 0x8001 /* old-fashioned adjtime */
> +#define ADJ_OFFSET_SS_READ    0xa001 /* read-only adjtime */
>  .fi
>  .in
>  .PP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
