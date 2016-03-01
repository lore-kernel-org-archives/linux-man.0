From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Tue, 1 Mar 2016 23:16:10 +0100
Message-ID: <56D614AA.7020500@redhat.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D607BB.6080701-764C0pRuGfqVc3sceRu5cw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Eggert <eggert-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/01/2016 10:20 PM, Paul Eggert wrote:
> On 03/01/2016 12:27 PM, Florian Weimer wrote:
>> We
>> should implement compiler support for this wart: inhibit optimizations
>> (I think there are already special cases for length-0 and length-1
>> arrays at the end, so it's not totally without precedent), and warn
>> about sizeof (struct dirent) and using it as a (non-pointer) declarator.
> 
> Why not use a flexible array member for this?

For which part, and how exactly?

You can't put a flexible array member into a transparent union.

> Sure, that assumes C99,
> but flexible array members are pretty much universally supported now
> (and we can fall back on the current layout for pre-C99 compilers). This
> would work better with modern compilers that treat small arrays with
> more respect than traditional C compilers did. And as I understand
> things, it would conform to POSIX (and if I'm wrong, POSIX should get
> fixed....).

If you mean to add some zero-width padding member at the end of the
struct, after the d_name member, then I'm worried that makes overrunning
the d_name array member even more undefined than it already is. :)

> For what it's worth, portable code cannot copy struct dirent values
> anyway, as this loses file names in operating systems like Solaris where
> d_name has size 1.

Interesting.  I feel slightly better now about having this overrunning
d_name member.

Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
