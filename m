Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0707318E23
	for <linux-man@vger.kernel.org>; Sat, 11 Nov 2023 18:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Greylist: delayed 448 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 11 Nov 2023 10:51:42 PST
Received: from mx.der-flo.net (mx.der-flo.net [193.160.39.236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974AD3879
	for <linux-man@vger.kernel.org>; Sat, 11 Nov 2023 10:51:42 -0800 (PST)
From: Florian Lehner <dev@der-flo.net>
To: alx@kernel.org
Cc: linux-man@vger.kernel.org,
	Florian Lehner <dev@der-flo.net>
Subject: [PATCH] remove mailmap from README
Date: Sat, 11 Nov 2023 19:43:57 +0100
Message-ID: <20231111184357.7930-1-dev@der-flo.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mailmap was removed with 2231a165. Therefore, remove its reference from the
README file.

Signed-off-by: Florian Lehner <dev@der-flo.net>
---
 README | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/README b/README
index 52cb6a57d..294e52008 100644
--- a/README
+++ b/README
@@ -42,9 +42,6 @@ Files
    lsm
        Linux software map.  See also <https://lsm.qqx.org/>.
 
-   .mailmap
-       See gitmailmap(5).
-
    LICENSES/*.txt
        Licenses in use by the project.
 
-- 
2.41.0

