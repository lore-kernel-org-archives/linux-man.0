From: Michael Kerrisk <mtk.manpages@gmail.com>
Subject: name_to_handle_at() and persistent filesystem IDs
Date: Sun, 16 Mar 2014 08:43:58 +0100
Message-ID: <CAHO5Pa0Y8r1DxHTc0YN-4geoLJ3JYwHT99EcuaGL6k++ek+aEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Cc: Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger@dilger.ca>, NeilBrown <neilb@suse.de>, Miklos Szeredi <miklos@szeredi.hu>, Bruce Fields <bfields@fieldses.org>, linux-man@vger.kernel.org, Christoph Hellwig <hch@infradead.org>
List-Id: linux-man@vger.kernel.org

Hello Aneesh,

I'm currently working on a man page for name_to_handle_at() and
open_by_handle_at(), and I have a question relating to a point that
probably needs to be covered in the man page.

Back in July 2010, in this thread:
http://thread.gmane.org/gmane.linux.file-systems/41782/focus=43131
you said:

[[
mount id should not be looked at as a persistent identifier. It should
be used to derive a persistent identifier from /proc/self/mountinfo. The
persistent identifier could be the combination of device properties,
file system properties or the uuid which is going to be an optional
tag in /proc/self/mountinfo.
]]

In the man page, I'd like to briefly describe how one derives such a
persistent ID from mountinfo. AFAICS, the optional UUID tag in
/proc/self/mountinfo has not come to pass. So, what then is the
recommended practice for deriving the persistent ID?

Cheers,

Michael

-- 
Michael Kerrisk Linux man-pages maintainer;
http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface", http://blog.man7.org/
