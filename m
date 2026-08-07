Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7519038E12D
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 04:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786075323; cv=none; b=iC1qltqXcrT1kwCRVdhIs3KU9JRf5+a7WVs0TbM2F51q/zUXn9brf3xa6gNpZeBx6IltrShMeI4GK2ZrpE8kXs8U5PKr+cNC0w9IdlddxrbIHkOBUtEkccAdCBZ4j0J5J/Pcp15O7RLd++XuUtD6M//4mL1ODvW7HsBaJWyL4kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786075323; c=relaxed/simple;
	bh=EY8jlHXRjGATrPs3VC/9yNXywzxtNGap8cPb+XKx9ys=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=OKlIMHE2Yf9IUXf1tfyzEASP4GncQSxYpQjDISzDWtKvzqEFullhvQ/978avo50W5sQo91eXhffxmPSIVpmvtMeJfxSRavlXQ2KFoxUqzTEnulLSmraOX9lKgncTjkkMzqVxMeZ6D2dz9uNfCZkqZDm69bmyFIrzq274Y2hshoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pl7VxUvz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pl7VxUvz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786075320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=lMPAXANNZQ8EbiVESfIsTNG5XetxDRF0Tzu4kAIIAQU=;
	b=Pl7VxUvztQh6YamzFbs5VMAbSOhfW9x1mssEfQddImVmMa0F5yWZwFKkLPtgTEKnmIxW8Q
	0QPkYycYBtOyVkOyw2y+EFXUIr12RPGYLkp/GSs1UfrY3jxkvX76sVu52ozHIwYUwQICz6
	ciXZN4jXAbjtLiD0+xloiOeE3hqk9AM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-601-GLZnQ6j2OXiGQ64QZTdq8g-1; Fri,
 07 Aug 2026 00:01:48 -0400
X-MC-Unique: GLZnQ6j2OXiGQ64QZTdq8g-1
X-Mimecast-MFC-AGG-ID: GLZnQ6j2OXiGQ64QZTdq8g_1786075307
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 10DBA1800365;
	Fri,  7 Aug 2026 04:01:47 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.120])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA3E8180049F;
	Fri,  7 Aug 2026 04:01:46 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 67741inS3391085;
	Fri, 7 Aug 2026 00:01:45 -0400
From: DJ Delorie <dj@redhat.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: alx@kernel.org, linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
In-Reply-To: <20260807034935.elgrkedh7c2a4txp@illithid>
 (g.branden.robinson@gmail.com)
Date: Fri, 07 Aug 2026 00:01:44 -0400
Message-ID: <xno6fe37fb.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

"G. Branden Robinson" <g.branden.robinson@gmail.com> writes:
> Right.  But having to know that is one of those fiddly details that
> deters people from using man(7), no?

Sure.  I vastly prefer semantic syntax like <ul> in HTML to the
presentation syntax in roff.  My complaint was just that I didn't know
how .PD worked and had to figure out where to put them, because
placement mattered and didn't do what I initially expected.

