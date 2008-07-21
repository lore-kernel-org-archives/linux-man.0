From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: math_error.7 draft 3, for review
Date: Mon, 21 Jul 2008 16:43:23 +0200
Message-ID: <cfd18e0f0807210743p69793dadq616c3e8ecf43d552@mail.gmail.com>
References: <cfd18e0f0807160647o776d8523yb2f1ed4f0d946911@mail.gmail.com>
	 <20080716213732.GA10011@ub>
	 <cfd18e0f0807210436h558aae2cu46f0100c439a8e4a@mail.gmail.com>
	 <20080721141514.GB11396@mette>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080721141514.GB11396@mette>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Jul 21, 2008 at 4:15 PM, Andries E. Brouwer
<Andries.Brouwer-rh8NL+sEX9E@public.gmane.org> wrote:
> On Mon, Jul 21, 2008 at 01:36:52PM +0200, Michael Kerrisk wrote:
>> Hi Andries,
>>
>> Reading the POSIX.1 specs of various functions, I see that sometimes
>> they talk of the return value of a function as being +0, sometimes
>> +-0, and sometimes -0.  Does one need to care about this?
>
> Yes.
>
> These are different floating point values, and sometimes the
> difference is important. In cases of total loss of precision
> it is the only bit left. At a branch cut one has a discontinuity
> and for example the imaginary part of clog(0.0) will be 0
> while the imaginary part of clog(-0.0) is pi*I.

Thanks Andries.  I will attend to the difference in my updates.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
