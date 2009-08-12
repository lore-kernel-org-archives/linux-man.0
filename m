From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 2/3] Add MAP_LARGEPAGE for mmaping pseudo-anonymous huge
	page regions
Date: Wed, 12 Aug 2009 07:07:48 +0200
Message-ID: <cfd18e0f0908112207y186d0aav6e0e55ce070778cf@mail.gmail.com>
References: <cover.1249999949.git.ebmunson@us.ibm.com>
	 <2154e5ac91c7acd5505c5fc6c55665980cbc1bf8.1249999949.git.ebmunson@us.ibm.com>
	 <a45eb555ca7d9e23e5eb051e27f757ae70a6b0c5.1249999949.git.ebmunson@us.ibm.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a45eb555ca7d9e23e5eb051e27f757ae70a6b0c5.1249999949.git.ebmunson-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric B Munson <ebmunson-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Eric,

On Wed, Aug 12, 2009 at 12:13 AM, Eric B Munson<ebmunson-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> wr=
ote:
> This patch adds a flag for mmap that will be used to request a huge
> page region that will look like anonymous memory to user space. =A0Th=
is
> is accomplished by using a file on the internal vfsmount. =A0MAP_LARG=
EPAGE
> is a modifier of MAP_ANONYMOUS and so must be specified with it. =A0T=
he
> region will behave the same as a MAP_ANONYMOUS region using small pag=
es.

Does this flag provide functionality analogous to shmget(SHM_HUGETLB)?
If so, would iot not make sense to name it similarly (i.e.,
MAP_HUGETLB)?

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
