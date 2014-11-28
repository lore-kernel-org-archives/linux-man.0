From: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] adjtimex.2: add explanation about ADJ_TAI action
Date: Fri, 28 Nov 2014 22:00:43 +0100
Message-ID: <20141128210043.GB14432@localhost.localdomain>
References: <54787B5C.1080802@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54787B5C.1080802-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Nov 28, 2014 at 02:40:44PM +0100, Laurent Georget wrote:
> @@ -101,7 +99,19 @@ combination of zero or more of the following bits:
>  Ordinary users are restricted to a zero value for
>  .IR modes .
>  Only the superuser may set any parameters.
> +.PP
> +Support for TAI (Atomic International Time, for a complete explanation
> about
> +what it is and what is the difference between TAI and UTC, see
> +.UR http://www.bipm.org/en/bipm/tai/tai.html
> +.I BIPM
> +.UE )
> +has been added in version 2.6.29. For any clock, the TAI offset may

Not for "any clock", just for CLOCK_REALTIME.

> +be calculated by adding a value to the UTC offset which is updated when a
> +leap second is added or deleted.
>  .br
> +All the offsets in the timex structure are expressed between the value
> of the
> +clock and the corresponding value (e.g. TAI offset is the difference
> between
> +the clock and the TAI, not between TAI and another value such as UTC).

The TAI offset is just (TAI - UTC). That's all.

Thanks,
Richard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
