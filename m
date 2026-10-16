Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C7857F75A
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171981; cv=none; b=jwiAUCHxOWvH1y3tHBxxvSzRjLzsfbGY2Hftajq6lwo5hp7+VRHYFR4cyZdGsv8QozBFJr7DjcGiHUEsM8ACeooDmSjdXo4AZFDC6lFTMN6w7aWpIJv7uVni+3YHB1drd3BY7iB7qE3lFXVAYD00hk1B7uuwEXXyGVU+yPy29HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171981; c=relaxed/simple;
	bh=LrHFyQ55Xb/P3EDrebzW4NnmmJC9gJGabaAraB2ASek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ArK0nhRjEyW2PsCMLF9vrGBQSd21bmufB+mvk/pjS/Olrl1MhqK3iG1xDzQxUakwuIeywybUZQoI9YxKjbrGkyPAVpiObKxrNl7wFmII/I2WA/bpPQoMEU3sIA+FZdE9yl+7PFB7tj+6YHBTgsJeAo9ZLiZW9HSW48XFXF75JTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJf25Bw9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJf25Bw9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df8fe8513so71881f8f.0
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171979; x=1792776779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k9G2cbi2r5caja+HXuRsXjE1ogbBA6VoP9Q9qhYwWBw=;
        b=KJf25Bw9fm7S46tGEvzvMBv8iX7QR44mhQLhLobYvr5dt5tteBmKQOgNEjojyfpBcL
         3ceBb+mXgD/N5fgAzb79tNbgo/9OKQG7CqwVCvytfWG80C+eH7HbQNVjnlsXXJKUiEHH
         yugMwhF4TY4VwbWm7g2ZkyeZy+6qFYMGD/ne/SpBF4cxRRi9emDl7glGpqRdjFplOKAf
         bmOsiklyzPZ/gh5hm1zISHjKK79RHzVGcBQr8RMpxzyWlblYzIDaRTvjbnHLLN/KDPaH
         VB9f/ur3nIlU9LCVL8CPxiDK34nBhyFuEDmLEtXofaBMj5BAJgLHHl/9jrU0oGo/5IMh
         Um+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171979; x=1792776779;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k9G2cbi2r5caja+HXuRsXjE1ogbBA6VoP9Q9qhYwWBw=;
        b=Ctmc8iifVYoFNT6W0rl76C0sa/xIXIa/kEed3NvW4bfVOVFeOt0HTT+bdlitA9vgRu
         zbUv7A+Ihg/5yQoT+NI6TNdtQXyn2cGgNz1PrRmsg14h6omQuBUW2UzhwB6k9NcZoiNK
         i4JT5qWsjdigsVaUFn0AvvT9/2yEdqSNXLesIAEYwOL6tdGxQiq6FmjD3K54KsHCGV+G
         z8I56LomFfbcelQ9S5ARJbhuWXOpit9nbw+r7q11Ov7duOqrxq4fFR6bP4CiyBWAMag/
         wN2aWD4S6CVIZnjp/bGKcWLFnEijREIRpkablNvWE3z1Y92ELAvboYudd5czlRc9jmrX
         8W+g==
X-Gm-Message-State: AFq9FYKoz1ZX5/mtpMUt6eyPeq+23dYFo3Ma0BP/u9svN/jk7gJw1oO2
	QN757bfn/ri7OVx8HN5JMs1lkaPkLYMeCwK2w79EwJN5Xdse5sE3Z1yV
X-Gm-Gg: AYBFou1r1Jzg5u1IkUga8cMrVhP9fzZKqLiddlACdX6Ylj/Z8Gl39VVKch6Lu9JNvgO
	JpBr8unCyGLNOsBSqHNLbYJ+C+QxiDo5wpvnaPHD77RtAYj0MUszqi5B5qkSzIxvfWsncX4X+gW
	wAv1OlLYhg0PuFvki/mP+Vc+gtX8nUa9mJ+8VyoRTY4VTZEPq0minzpk8WqSZY8O+T6cMbe7bs1
	2dasdrPiFyPkaoa9b94pJ4TDcZzuGA+l2BDlBtxbHEiI86+9r3Gt6AdKrB8atG3IWL9TOrW4z38
	y8mjIGxb6Kzjk3P+bSOWU7dh7TZdtvVMD0cMFikEV9OT8DEpSeIYdFhmELg/psUEH+Zdnr80Y5f
	CnlXefLEcpSfxHVgDqr6t5mLOGN8YQ9xGShhAJRHhrGpn8dkuoqOGbd71VxsQRPw86VeitSbMOs
	IXt7+ebylPNZphZWFxEDF0tsCxlg6DdQMlGYM/C9fsgegDfk4r/0QUgnUjI5c5Gn6QXZbWd87iq
	UDzx7UoBD2A5DRzrgoCf6I=
X-Received: by 2002:a05:6000:46dc:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-48e07988a96mr467385f8f.6.1792171978821;
        Fri, 16 Oct 2026 10:32:58 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfe4d2321sm6744654f8f.19.2026.10.16.10.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:58 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 09/24] man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
Date: Fri, 16 Oct 2026 19:31:24 +0200
Message-ID: <20261016173139.13076-10-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016173139.13076-1-gnoack3000@gmail.com>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SOCK_SEQPACKET sockets use unix_stream_connect() as their connect
operation (see unix_seqpacket_ops in linux.git net/unix/af_unix.c), and
that function records the peer credentials for both ends.
unix_socketpair() records them for socket pairs of every type.

Connected SOCK_DGRAM sockets (unix_dgram_connect()) still don't record
peer credentials, so those remain excluded.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Double checked in code.
    
    The unix(7) SOCK_SEQPACKET socket type is also connection-oriented and
    shares the "connect" logic with SOCK_STREAM sockets.

 man/man7/unix.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 86e72d0f58d4..8fd29131ce48 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -342,9 +342,9 @@ feature test macro to obtain the definition of that structure from
 .IP
 The use of this option is possible only for connected
 .B AF_UNIX
-stream sockets and for
+stream and sequenced-packet sockets, and for
 .B AF_UNIX
-stream and datagram socket pairs created using
+socket pairs created using
 .BR socketpair (2).
 .\"
 .SS Autobind feature
-- 
2.56.0

