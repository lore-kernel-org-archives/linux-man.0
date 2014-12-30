From: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] adjtimex.2: Add details about ADJ_FREQUENCY
Date: Tue, 30 Dec 2014 19:05:49 +0100
Message-ID: <20141230180549.GB7403@localhost.localdomain>
References: <54A2DEAD.2050708@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54A2DEAD.2050708-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Dec 30, 2014 at 06:19:41PM +0100, Laurent Georget wrote:
> Hi,
> 
> this is another patch for adjtimex(2) man page which fixes a FIXME by
> giving the scaling unit of timex.freq and adds a detail about the value
> expected by ADJ_FREQUENCY.
> 
> Laurent
> 
> diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
> index 18823c8..2652fc6 100644
> --- a/man2/adjtimex.2
> +++ b/man2/adjtimex.2
> @@ -55,8 +55,8 @@ struct timex {
>                           status flag is set, otherwise
>                           microseconds */
>      long freq;        /* Frequency offset, as scaled PPM
> -                         (parts per million) */
> -.\" FIXME What is the scaling unit of timex.freq?  2^16 ?

Your text sounds funny and seems unclear to me.  How about something
more like this:

	long freq	/* Frequency offset in PPM with a 16 bit
			   factional field */

> +                         (parts per million) :
> +                         the scaling unit of timex.freq is 2^16 usec =
> 1000*2^16 nsec.

Your mailer is wrapping lines here ...

>      long maxerror;    /* Maximum error (microseconds) */
>      long esterror;    /* Estimated error (microseconds) */
>      int  status;      /* Clock command/status */
> @@ -106,6 +106,10 @@ Set time offset from
>  .BR ADJ_FREQUENCY
>  Set frequency offset from
>  .IR buf.freq .
> +The clock frequency must be comprised between -500000 and 500000 scaled
> ns/s.

and here.

The phrase "must be comprised" does not make any sense in this
context. How about this instead?

   The allowed frequency range is -500 PPM to +500 PPM.

> +If the given value is outside those bounds, it is silently truncated. This
> +corresponds to values between -32768000 and 32768000 for
> +.IR buf.freq .
>  .TP
>  .BR ADJ_MAXERROR
>  Set maximum time error from
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
