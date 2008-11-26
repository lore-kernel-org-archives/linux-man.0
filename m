From: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: mount(8) manpage and filesystem-specific options
Date: Wed, 26 Nov 2008 15:46:17 -0500
Message-ID: <5E1BB896-E0F1-4F49-ADCF-FCBEB15BE3AA@oracle.com>
References: <20081126041558.GA9251@infradead.org> <20081126105444.GO2961@nb.net.home> <20081126200526.GX3186@webber.adilger.int>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20081126200526.GX3186@webber.adilger.int>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Andreas Dilger <adilger@sun.com>
Cc: Karel Zak <kzak@redhat.com>, Christoph Hellwig <hch@infradead.org>, util-linux-ng@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Nov 26, 2008, at 3:05 PM, Andreas Dilger wrote:
> On Nov 26, 2008  11:54 +0100, Karel Zak wrote:
>> On Tue, Nov 25, 2008 at 11:15:58PM -0500, Christoph Hellwig wrote:
>>> Currently the mount(8) manpages which is contained inside util-linux
>>> has a list of mount options for various filesystem.  Now the  
>>> filesystems
>>> are in the kernel tree and can change options without affecting the
>>> mount binary, and of course do so frequently.  This means these  
>>> options
>>> are frequently out of date.  All these options also make the manpage
>>
>> Yes, you're right.
>>
>>> quite large and harder to read.  What do peope think about adding a
>>> (section 4?) manpage for every common filesystem in the man-pages
>>
>> Something like this is on my wish list for long time ;-)
>
> I see on my system that there are already mount.nfs(8) and  
> mount.cifs(8)
> man pages, but this is because /sbin/mount.{nfs,cifs} are separate  
> binaries.

NFS mount options are documented in nfs(5) of all places.   
mount.nfs(8) documents only the command-line options for /sbin/ 
mount.nfs, but not NFS mount options.  Kind of confusing.

> I DO think that it makes sense to have separate mount.{fstype} man  
> pages
> to clean up the mount(8) man page.  I've also thought that this page  
> is
> a huge mess.

...especially because support for individual file systems can often be  
separately installed on most distributions I commonly use.  XFS has  
been treated this way, for example, until just recently.  nfs(5) and  
mount.nfs(8) come from nfs-utils, not from util-linux.

> <aside>
> I never know what man section to put a new man page in, because the
> descriptions of the section numers isn't given in the man(1) man page
> itself, nor in any document in SEE ALSO.
> </aside>

+1

Just as an example of what could be done, Solaris uses mount_nfs(1M)  
to document NFS mount options (and mount_zfs(1M) and so on), but the  
administrative command interface is always "mount."  The subcommands  
are hidden, and I'm not aware of any visible documentation for them.   
The man pages describing mount options for individual file systems are  
referenced in mount(1M)'s SEE ALSO section.

--
Chuck Lever
chuck[dot]lever[at]oracle[dot]com
