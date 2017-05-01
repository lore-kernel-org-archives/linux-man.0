From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH man-pages 0/5] {ioctl_}userfaultfd.2: yet another update
Date: Mon,  1 May 2017 08:43:14 +0300
Message-ID: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Hi Michael,

These updates pretty much complete the coverage of 4.11 additions, IMHO.

Mike Rapoport (5):
  ioctl_userfaultfd.2: update description of shared memory areas
  ioctl_userfaultfd.2: UFFDIO_COPY: add ENOENT and ENOSPC description
  ioctl_userfaultfd.2: add BUGS section
  userfaultfd.2: add note about asynchronios events delivery
  userfaultfd.2: update VERSIONS section with 4.11 chanegs

 man2/ioctl_userfaultfd.2 | 35 +++++++++++++++++++++++++++++++++--
 man2/userfaultfd.2       | 15 +++++++++++++++
 2 files changed, 48 insertions(+), 2 deletions(-)

-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
