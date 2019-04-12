From: Slavomir Kaslev <kaslevs@vmware.com>
Subject: [PATCH 0/2] Add note on splice/tee EAGAIN error when called with nonblocking descriptors
Date: Fri, 12 Apr 2019 17:02:45 +0300
Message-ID: <20190412140247.9897-1-kaslevs@vmware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, slavomir.kaslev@gmail.com
List-Id: linux-man@vger.kernel.org

Document that splice(2)/tee(2) can fail with EAGAIN when called with nonblocking
file descriptors and the operation would block.

Slavomir Kaslev (2):
  splice.2: Note EAGAIN can occur when called on nonblocking file
    descriptors
  tee.2: Note EAGAIN can occur when called on nonblocking file
    descriptors

 man2/splice.2 | 4 +++-
 man2/tee.2    | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.19.1
