From: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Subject: Re: Wrong formulae for complex elementary functions
Date: Thu, 15 Sep 2011 18:24:10 +0200
Message-ID: <20110915162410.GA17672@iq>
References: <4CEF7677.30500@ginac.de>
 <AANLkTinAUyVTdjxY9KVgnOerWxhXtnvmHeTQ-Gb0-TxC@mail.gmail.com>
 <4E3C61FE.1010107@ginac.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E3C61FE.1010107-HEL5OUoDxoc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Richard B. Kreckel" <kreckel-HEL5OUoDxoc@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas Enge <andreas.enge-MZpvjPyXg2s@public.gmane.org>, Bill Allombert <Bill.Allombert-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>, Karim Belabas <Karim.Belabas-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Aug 05, 2011 at 11:34:54PM +0200, Richard B. Kreckel wrote:
> Hi everybody,
> 
> On 11/27/2010 08:37 AM, Michael Kerrisk wrote:
> >Hi Andries,
> >
> >Since you are the mathematician, can you comment?

Hi everybody,

Now that I see this discussion again:
Mathematically speaking there is no unique correct definitions.
The function is multiple-valued and some arbitrary agreement
fixes one of the values.

Richard's point of view is that the actual behavior of the library functions
should be documented. Not a bad idea, but perhaps one should document what
the standard says, and then file a bug report in case the implementation
does something else.

I lost most of my old docs, but just rediscovered a copy of
ISO-C-FDIS.1999-04.pdf, I don't know whether that still is the
appropriate source to consult.

(i)
It says in 7.3.1: cacos: branch cuts outside [-1,1] along the real axis
returns arccos z where Re arccos z lies in [0,pi].
So, if z = cos w then w = arccos z, but because cos (w + 2pi) = cos w
and cos (-w) = cos w, we can pick w with real part in [0,pi].

It says in 7.3.7.2: clog: branch cut along the negative real axis
returns log z where Im log z lies in [-I*pi,I*pi].

It says in 7.3.8.3: csqrt: branch cut along the negative real axis
returns sqrt z where Im sqrt z >= 0.

We want to check whether it is true that
cacos(z) = -I* clog(z + I*csqrt(1 - z * z))

Suppose w = cacos(z). Then w is defined by cos w = z and Re w in [0,pi].
The question is whether iw = log(cos w + i sqrt(sin^2 w)).
If sin w has nonnegative imaginary part, then sqrt(sin^2 w) = sin w
and the question is whether iw = log(e^{iw}). This logarithm is
chosen with imaginary part in [-pi,pi] but w has imaginary part
in [0,pi], so this equality holds.
If sin w has negative imaginary part, then sqrt(sin^2 w) = -sin w
and the question is whether iw = log(e^{-iw}), and again this holds.

I agree with Richard's equation.

(ii)
Claim: catan(z) = (clog(1 + iz) - clog(1 - iz)) / 2i

7.3.5.3: catan: branch cuts outside [-i,i] along the imaginary axis
returns atan z where Re atan z lies in [-pi/2, pi/2].

Suppose w = catan(z). Then w is defined by tan w = z and Re w in [-pi/2, pi/2].
Up to a multiple of 2pi*i the RHS is
(1/2i)log((cos w + i sin w)/(cos w - i sin w)) = (1/2i) log e^{2iw},
looks good. The two multiples of 2pi*i partially cancel, so after
dividing by 2i this is in [-pi/2, pi/2].

I agree with Richard's equation.

(iii)
Claim: catanh(z) = (clog(1 + z) - clog(1 - z))/2

7.3.6.3: catanh: branch cuts outside [-1,1] along the real axis
returns atanh z where Im atanh z lies in [-pi/2,pi/2].

Suppose w = catanh(z).
Then w is defined by tanh w = z and Re w in [-pi/2,pi/2].
Up to a multiple of 2pi*i the RHS is correct, and just like before
we get the right value.

I agree with Richard's equation.

So, if I make no mistake, Richard is correct on all counts.

Andries
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
