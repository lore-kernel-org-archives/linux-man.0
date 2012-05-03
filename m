From: Ted Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Subject: Re: [PATCH] open(2): document O_PATH
Date: Thu, 3 May 2012 09:07:07 -0400
Message-ID: <20120503130707.GF18002@thunk.org>
References: <1335669917-23970-1-git-send-email-vapier@gentoo.org>
 <CAKgNAkgykZJV59WJXW9c9gVwXhn=WNYKxo_W1GM7ocHEEFqEXg@mail.gmail.com>
 <877gwxacti.fsf@skywalker.in.ibm.com>
 <20120430114410.GB28308@thunk.org>
 <87fwbhhdp2.fsf@skywalker.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87fwbhhdp2.fsf-6yE53ggjAfyqSkle7U1LjlaTQe2KTcn/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, May 03, 2012 at 01:57:21PM +0530, Aneesh Kumar K.V wrote:
> 
> fstat won't work, but fstatat with an empty path name would work. O_PATH
> descriptors are suppose to be used as "location only descriptors". 
> We then extended the *at syscalls to work with EMPTY pathnames so that
> O_PATH descriptors can be used with readlink, fchownat and fstatat().
> This was done to enable us to do these operation on symlinks.
> (65cfc6722361570bfe255698d9cd4dccaf47570d)

Could you define explicitly what you mean by "EMPTY" pathnames?  Do
you mean a path name that doesn't exist?  (i.e., one of the
directories specified in the pathname does not currently exist in the
directory hierarchy visible to the process).

					- Ted

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
