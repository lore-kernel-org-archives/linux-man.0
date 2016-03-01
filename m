From: Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Tue, 1 Mar 2016 17:27:28 -0500
Message-ID: <20160301222728.GK9349@brightrain.aerifal.cx>
References: <20130611011324.GT29800@brightrain.aerifal.cx>
 <51B8702D.2060505@redhat.com>
 <20130813040038.GE21795@spoyarek.pnq.redhat.com>
 <520C88A6.9070501@redhat.com>
 <56D54DAD.1040306@gmail.com>
 <56D5CA79.9030204@redhat.com>
 <56D5F832.3070209@gmail.com>
 <56D5FB3D.5000306@redhat.com>
 <56D60335.7010906@gmail.com>
 <56D615D7.5020304@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56D615D7.5020304-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Mar 01, 2016 at 11:21:11PM +0100, Florian Weimer wrote:
> On 03/01/2016 10:01 PM, Michael Kerrisk (man-pages) wrote:
> > On 03/01/2016 09:27 PM, Florian Weimer wrote:
> >> On 03/01/2016 09:14 PM, Michael Kerrisk (man-pages) wrote:
> >>
> >>> What happens with readdir() when it gets a filename that is larger 
> >>> than 255 characters?
> >>
> >> Good question.  Ugh.
> >>
> >> readdir will return a pointer to a struct dirent whose d_name member
> >> will not be null-terminated, but the memory following the struct dirent
> >> object will contain the rest of the name, and will eventually be
> >> null-terminated.
> > 
> > So, in other words, if the caller users a declaration of the form
> > 
> >     struct dirent d;
> > 
> > (rather than say allocating a large buffer dynamically), then we have 
> > a buffer overrun?
> 
> readdir gives you only a struct dirent * to an internal buffer.  If you do
> 
>   struct dirent *e = readdir (dir);
>   memcpy (&d, e, sizeof (d));
> 
> you can end up with a truncated name.  According to Paul's comment, this
> kind of truncation is very visible on Solaris.

POSIX also cautions you that this is a permitted definition. See:

http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/dirent.h.html

It's covered under the description and rationale.

Rich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
