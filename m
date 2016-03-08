From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Tue, 8 Mar 2016 13:20:07 +0100
Message-ID: <56DEC377.9070204@redhat.com>
References: <51B0B39F.4060202@redhat.com> <51B0BD36.3030202@redhat.com>
 <CAHGf_=r9Rz63pho+84ORk0a_oDyJSj-MCnZ56uPrT3L6sVEfeQ@mail.gmail.com>
 <20130607013024.GO29800@brightrain.aerifal.cx> <51B19203.3070307@redhat.com>
 <20130607144143.GQ29800@brightrain.aerifal.cx> <51B57E35.4080403@redhat.com>
 <51B65EA7.2020402@redhat.com> <20130611011324.GT29800@brightrain.aerifal.cx>
 <51B8702D.2060505@redhat.com>
 <20130813040038.GE21795@spoyarek.pnq.redhat.com>
 <520C88A6.9070501@redhat.com> <56D54DAD.1040306@gmail.com>
 <56D5CA79.9030204@redhat.com> <56D5F832.3070209@gmail.com>
 <56D5FB3D.5000306@redhat.com> <56D607BB.6080701@cs.ucla.edu>
 <56D614AA.7020500@redhat.com> <56D61A86.3050108@cs.ucla.edu>
 <56D620AA.40108@redhat.com> <56D624FE.1090702@cs.ucla.edu>
 <56D6294A.5040703@redhat.com> <56D72683.6010302@cs.ucla.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D72683.6010302-764C0pRuGfqVc3sceRu5cw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Eggert <eggert-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/02/2016 06:44 PM, Paul Eggert wrote:
> +/* Declare a structure member named ID, with type "array of TYPE", and
> +   with actual size unspecified but with nominal size SIZE for the
> +   benefit of traditional applications.  If the application is
> +   compiled with _FLEXARRAY_SOURCE and if the compiler is C99 or
> +   better, model this as a flexible array.  Otherwise, model it as a
> +   fixed-size array of size SIZE (followed by a flexible array
> +   afterwards, if C99, for the benefit of source-code analyzers that
> +   can use this as a cue that the array is really varying-size).  The
> +   fixed-size array is for compatibility with programs that unwisely
> +   take the size of structures that contain flexible arrays, and which
> +   rely on traditional glibc which uses fixed-size arrays.  */
> +#ifndef __flexarray
> +# ifdef __USE_FLEXARRAY
> +#  define __flexarray(id, type, size) type id[]
> +# else
> +#  define __flexarray(id, type, size) type id[size]; type __flexarray __flexarr
> +# endif
> +#endif

Sorry, I'm not convinced this is good compiler hint.  I suspect it moves
things in the opposite direction.  Some compilers likely have hacks to
support arrays of length 1 as flexible arrays if the array is at the end
of a struct, and after your change, the member is no longer at the end,
potentially disabling the flexible array kludge.

I think we should interact better with compilers in this area, but this
needs fairly explicit mark-up, showing what we need, and not something
that requires the compiler to guess.

Thanks,
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
