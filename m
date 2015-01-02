From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH] adjtimex: PPM scaling is by 2^-16
Date: Fri, 2 Jan 2015 07:29:20 +0100
Message-ID: <20150102062920.GB4221@localhost.localdomain>
References: <54A2DEAD.2050708@supelec.fr>
 <20150102024118.GA8293@unpythonic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150102024118.GA8293@unpythonic.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeff Epler <jepler@unpythonic.net>
Cc: linux-man <linux-man@vger.kernel.org>, Laurent Georget <laurent.georget@supelec.fr>, linux-kernel@vger.kernel.org, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
List-Id: linux-man@vger.kernel.org

On Thu, Jan 01, 2015 at 08:41:20PM -0600, Jeff Epler wrote:
> Like Laurent Georget, I found by reading ntpd source
> the scale is 2^16 (i.e., 1 ~= 1.5e-5 ppm, 65536 = 1ppm)

Yep, you wont find this documented in prose anywhere, not even at
ntp.org.

> -    long freq;        /* Frequency offset, as scaled PPM
> +    long freq;        /* Frequency offset, in units of 2^-16 PPM
>                           (parts per million) */

This wording is correct.

IMHO, it is more understandable when you explain that this field is a
fixed point number, with a 16 bit binary fraction. For example, see
the comment in the function, ppb_to_scaled_ppm(), in
Documentation/ptp/testptp.c.


Thanks,
Richard
