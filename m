From: Guillem Jover <guillem@hadrons.org>
Subject: Re: st_size of a symlink
Date: Tue, 24 Jul 2012 01:13:33 +0200
Message-ID: <20120723231333.GA1299@gaara.hadrons.org>
References: <500D73FF.1070504@nod.at>
 <alpine.LNX.2.00.1207231959410.1922@swampdragon.chaosbits.net>
 <20120723202224.GH31729@ZenIV.linux.org.uk>
 <alpine.LNX.2.00.1207232243110.1922@swampdragon.chaosbits.net>
 <500DCB34.6050209@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <500DCB34.6050209@nod.at>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Weinberger <richard@nod.at>
Cc: Jesper Juhl <jj@chaosbits.net>, Al Viro <viro@ZenIV.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Tue, 2012-07-24 at 00:07:48 +0200, Richard Weinberger wrote:
> On 23.07.2012 22:47, Jesper Juhl wrote:
> >>Fix it _how_?
> >
> >By returning the size as the number of bytes in the name the link is
> >currently pointing at.
> 
> This is not easy.
> procfs has no clue where the link pointing at.
> The information is generated while accessing the link.
> tmpfs on the other hand has this information because symlinks get
> only changed through tmpfs...

Well, can't the link be accessed when getting the stat information
then?

> >>  By retrying readlink() with bigger buffer.
> >>With procfs there's just a few more ways the readlink() output can
> >>change, that's all.
> >>
> >Still not a good reason to just return 0 IMHO.
> 
> IMHO the lstat() and readlink() manpages have to be more precise
> about st_size.

They document what POSIX says:

  <http://pubs.opengroup.org/onlinepubs/009695399/basedefs/sys/stat.h.html>

regards,
guillem
