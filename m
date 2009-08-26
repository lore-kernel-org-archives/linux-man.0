From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH 1/3] hugetlbfs: Allow the creation of files suitable for
 MAP_PRIVATE on the vfs internal mount
Date: Wed, 26 Aug 2009 12:34:15 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.0908261234020.4511@chino.kir.corp.google.com>
References: <cover.1251197514.git.ebmunson@us.ibm.com> <25614b0d0581e2d49e1024dc1671b282f193e139.1251197514.git.ebmunson@us.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <25614b0d0581e2d49e1024dc1671b282f193e139.1251197514.git.ebmunson@us.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Eric B Munson <ebmunson@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org, linux-man@vger.kernel.org, mtk.manpages@gmail.com, randy.dunlap@oracle.com
List-Id: linux-man@vger.kernel.org

On Tue, 25 Aug 2009, Eric B Munson wrote:

> There are two means of creating mappings backed by huge pages:
> 
>         1. mmap() a file created on hugetlbfs
>         2. Use shm which creates a file on an internal mount which essentially
>            maps it MAP_SHARED
> 
> The internal mount is only used for shared mappings but there is very
> little that stops it being used for private mappings. This patch extends
> hugetlbfs_file_setup() to deal with the creation of files that will be
> mapped MAP_PRIVATE on the internal hugetlbfs mount. This extended API is
> used in a subsequent patch to implement the MAP_HUGETLB mmap() flag.
> 
> Signed-off-by: Eric Munson <ebmunson@us.ibm.com>

Acked-by: David Rientjes <rientjes@google.com>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
