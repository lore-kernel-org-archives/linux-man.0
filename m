From: Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH man-pages] open.2: improve O_PATH documentation.
Date: Thu, 10 Aug 2017 08:50:34 -0700
Message-ID: <20170810155034.GH31390@bombadil.infradead.org>
References: <873790rtni.fsf@notabene.neil.brown.name>
 <20170810102104.GA16888@gardel-login>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170810102104.GA16888@gardel-login>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
Cc: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Aug 10, 2017 at 12:21:04PM +0200, Lennart Poettering wrote:
> On Do, 10.08.17 13:25, NeilBrown (neilb-IBi9RG/b67k@public.gmane.org) wrote:
> > +.RB ( ".f_type == AUTOFS_SUPER_MAGIC" ).
> 
> Because Linux is broken you shouldn't compare f_type just like this,
> and the man page probably shouldn't suggest that either I figure. The
> only safe way is something like this:
> 
>      s.f_type == (typeof(s.f_type)) AUTOFS_SUPER_MAGIC
> 
> That's because f_type is defined with different types (both signed and
> unsigned) on different archs, and the magic values tend to use the
> full unsigned 32bit range...

Please give an example where Neil's formulation would fail.

$ git grep -w f_type arch/*/include |cut -d: -f 2- |sort -u
	int		f_type;
	long		f_type;
	s32		f_type;
	__u32	f_type;
	u32		f_type;
	unsigned int	f_type;

I quote the C standard here for your convenience:

Otherwise,  the  integer  promotions  are  performed  on  both  operands.

Then  the following rules are applied to the promoted operands:
If both operands have the same type, then no further conversion is needed.

Otherwise, if both operands have signed integer types or both have unsigned
integer  types,  the  operand  with  the  type  of  lesser  integer
conversion  rank  is converted to the type of the operand with greater rank.

Otherwise,  if  the  operand  that  has  unsigned  integer  type  has  rank
greater  or equal  to  the  rank  of  the  type  of  the  other  operand,
then  the  operand  with signed  integer  type  is  converted  to  the  type
of  the  operand  with  unsigned integer type.

Otherwise, if the type of the operand with signed integer type can represent
all of the values of the type of the operand with unsigned integer type, then
the  operand  with  unsigned  integer  type  is  converted  to  the  type  of
the operand with signed integer type.

Otherwise,   both   operands   are   converted   to   the   unsigned   integer
type corresponding to the type of the operand with signed integer type

> (Yes, strictly speaking AUTOFS_SUPER_MAGIC isn't one of the unsigned
> 32bit ones, but I think it's better to stick the same rules for all
> magic values comparisons here...)
> 
> (And yes, the statfs() man page only mentions the problem briefly,
> without the typeof way out, but it really should)
> 
> Lennart
> 
> -- 
> Lennart Poettering, Red Hat
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
