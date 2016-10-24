From: Wang Nan <wangnan0@huawei.com>
Subject: [PATCH v3][manpages 0/2] Document new feature in perf_event_open
Date: Mon, 24 Oct 2016 06:52:54 +0000
Message-ID: <20161024065256.160703-1-wangnan0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com, vincent.weaver@maine.edu
Cc: pi3orama@163.com, linux-kernel@vger.kernel.org, lizefan@huawei.com, linux-man@vger.kernel.org, Wang Nan <wangnan0@huawei.com>
List-Id: linux-man@vger.kernel.org

Decribe PERF_EVENT_IOC_PAUSE_OUTPUT and write_backward in man pages.

v2 -> v3:
  Correct words.
  Explain the relationship between readonly ring buffer and
   over-writable ring buffer in patch 1/2.

Wang Nan (2):
  perf_event_open.2: Document PERF_EVENT_IOC_PAUSE_OUTPUT
  perf_event_open.2: Document write_backward

 man2/perf_event_open.2 | 81 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 2 deletions(-)

-- 
2.10.1
