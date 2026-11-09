Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794190153;
	b=WPlmg+23L1FHf5XGKVszgd+ZdN7O5JpABFCVoPE3IKoEy6sGFMRu1QPK1vUrpQCp788o
	 DxpYyIaDT1xYG5TZCULnxA+FCNuSb04gU1g8T0umsObkehwaKPTBSiM/y6oqyMmAm8SxG
	 aVgDJym8BwOTYxBxUns2nRBT3yu0I8ulApgkWl5/smLcWvRzxdZG4bT/OXpOtJMzJOnqd
	 VdcYdJmpr8dePpoegFSSh4x5qZJAfDETqKBfM6WAmGWKeaWpu0eEU405wIeGFsF+TWhRl
	 zRwQElHtATFEfG5KWqzNSJWp4t/n/hRa44FapGB1n7qkPHdjj6ZskdDRzLY6nlMDAeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=YctNCq5hPULp+CDuxLhMfDSqLWy/ijlT8N5kwiWatOQ=;
	b=2DQWAMgz1xBjaqZdmX1LACcM/WD3G2cvFFCwzvNYt0o6P+Z08z2n50F5GdQbxhvQ9ARu
	 q5GfUevxkOT299DZgNETROkdYziNCbmM489QXvp7ZLdwDOPGY23XT9FTJXKPDJ2/Yzlbq
	 5ZtCLVBIQEQigdiG9yyKmf/+jEJXpcLmQVWECikCtzy85cYFaFcVxUnXsqmnqXvoRKpIE
	 Et+ocPQ0rg2mMseM5Hqp9Q1zZG98/2GUAUYPwitH2cSDpYuoI7LOBcZN3oUeRTTV/3+ab
	 /l7coeoP3N9nhwpOxXCHl+7AjBEi/rKP43uf3MF8HxpvOU4IIJQdF7BDxrwVvQpkVZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ollien.com;
	spf=none smtp.mailfrom=ollien.com;
	dkim=pass header.d=ollien-com.20260707.gappssmtp.com header.i=@ollien-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=quRBSG+Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C59D606A31C
	for <linux-man@vger.kernel.org>; Mon,  9 Nov 2026 02:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C59D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ollien.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ollien.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ollien-com.20260707.gappssmtp.com header.i=@ollien-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=quRBSG+Y
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so526280a12.1
        for <linux-man@vger.kernel.org>; Sun, 08 Nov 2026 18:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794190151; cv=none;
        d=google.com; s=arc-20260327;
        b=fpXW9uOjMnPM/BI0oPlBbZunFD1gm9qiaPtuo08/cqc3r1gNT/b6Wfm1I85jCqXnjj
         QgfJMCtS4//0jGAtsLqNwVTTNfoMFXL8Su8fkLk/csY8sCnzxRarL2J91T2wvBAOK+kf
         9hGoPXwbzZ1QDH9OeZTZb6atgUh2xY5lgqhCyy/WjNv0J5oLag8JpaJh4BsLOU6eg2D9
         G79w+Y9x9PubE5u3g8fE41Wywj+m3rftO/rjJz9l6v0tqPJ+GGJ3J6gjLB7Qupxv+bfp
         AOjm8aFAPjN/niRQixr8nr2ux71cISkaVqG2ZG6XQ1h5Jm9k9z74I5NU7mZqVjrH7XBh
         SBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YctNCq5hPULp+CDuxLhMfDSqLWy/ijlT8N5kwiWatOQ=;
        fh=sW2LRhf8dCzV3KTpnkKlIOmbMpskZKBNmGh9DNFw3kQ=;
        b=O5gJKa5Z2Ujcm6vem/PpujDXJbaa3nvfYJvE+eIeCj0NP52HPqbeAXONeu9iWCSkaT
         0jeBuQUadcN5v36WQ85WXE49iRT/YWWTrDwB/R0T9VdL45TOEVHxTycS/JtXSXxd3/Ei
         Fy/b6X75EsqX5TvyQDUbjxqT7VXSdOZnsESEm63dHzAPYw+Kh5KCjNoEFYoJROdy1flC
         ZC2rnLdTqxi7MucxdtfLKjjomKm80X3XRALByL8vOjCJnzeQ9OCfI8OtpWhnXVI3o7Dh
         AsCgMVgNvy8eLsVQtHtlwGKt6Zle90Nni8IcrFcBBPGxxw+vSWPWGNiPdawomLGAIDLw
         Y6WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ollien-com.20260707.gappssmtp.com; s=20260707; t=1794190151; x=1794794951; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YctNCq5hPULp+CDuxLhMfDSqLWy/ijlT8N5kwiWatOQ=;
        b=quRBSG+YLpiog1EDWiaPUfipmqei4qqFs95/KoWMUBjNNDEhnstrbhxLdsJKCgKg74
         AH12GaWqpKckt7T8hxOmJGeyElhahy54RRvKV6jkgeVZQeJolB6Kh2v4sTXjgJDWg6rQ
         n5LKjHTFfFgsi81ByQuqVOIYfTlPou2PEf0+gJ9iZHkc3xp3pIJYbrnYZVW7zbKzDKf4
         3al6aEdzxc92RIbAoSRx5s6tXz27/9SBsvZxxwKwDeaLB8TV9StV14liamcKdoA+FqU8
         IVHSNjwdgW0ejGU/nBju6rUFe0MH6fB7OtUavvTzjVpOmDXxT4nfQAlXWAW+b3/HS+XS
         pPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190151; x=1794794951;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YctNCq5hPULp+CDuxLhMfDSqLWy/ijlT8N5kwiWatOQ=;
        b=2cHbaakHGwGvNSKFPPwIZCXMLckAVP+jYiLH7eaYWZAvGAqrQWyHMf2IkqVjKVLQwF
         xJwIdYOIix/Y6RNXJXtgx0mRsrEdr7RaDtmmY0ZEA8Fk3LQHTLRQBLJCZGPIAmE6alBZ
         ecMCUhpfl4ayoFkIekxqYdWqr/EdPVKR6qVE/7j3tj7fGhGdrMxh99AxdYWG30/+yLnP
         oeaadboqF34B5J4FekjV788CYwdK4S8bBiH1WaFHl2KzgZx+gBBuF8N25wEhqY7CdNwC
         WtELdbmokgEoxiPWj0DkeUtwkxTAVPFxMTMxmw3MuBP0X9OThMWIdulI42nfwa14EFnx
         d8sA==
X-Gm-Message-State: APuU4Z/J+cr5fNSiTiol6iLMBBgYLwGYntIDFZWuc+qd95PW7IVPfP7r
	lp1Avoku3iSDsNgnUXLQnc5sSjOFTR/CMKbZEJCMgY5tqLljh5dyV1aDMoLCE1EaeivhoULDUoH
	3qUpGnkdUForwqKSqqA6+KgfQFkohn9szFiG4Zqt8aHjs79AvwRZ5CsYndQ==
X-Gm-Gg: AYBFou1cGHlW/ig4Jj2ilL5fEMiH7ZkvL6g2htWde4Cu7f+RPfOCbnKI7dvey4hXw1/
	SkqnfwT10CWobU65KVrJP/hs5uJTsQCbpk9+hMzH/HlLLvlWG7QlMElb6wvbVhrxoStpzNcnu5X
	Z5lhJMSVK6o70u+HIMSETspe2P8rA9Lt8HDA9I9SNZtIPO7YPXvbnJuF94BpeYAFF+yk1HGY2WS
	ljnerTe4aUcVZ1YEvW4b2+dlrqXw0Ev+xhIQGMXD+iLNIvrnFQJR8s19WNsBch5JJx7h7ryJBUy
	pvk2b2zWbbnzmb6PCcoYjZVNZ22tmfnlTvVziFqPe0lG14gmT0cvWrdmOYgAAvqLWsgKzlr46dy
	iVeauZopBv2kpAkwXAIWIQXeM6RLsg1Cu1of9mw==
X-Received: by 2002:a05:6402:4504:b0:6b5:4baf:ad96 with SMTP id
 4fb4d7f45d1cf-6b7224194a7mr1712391a12.17.1794190150196; Sun, 08 Nov 2026
 18:09:10 -0800 (PST)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Nick Krichevsky <nick@ollien.com>
Date: Sun, 8 Nov 2026 21:08:44 -0500
X-Gm-Features: AclHuK9MswfdY4D622b-_3Nn4mr1M235tqjZpvulF_e0zepd-2ftlnwbNFLEbik
Message-ID: <CAN8n623GU-VbFJF1O7nDWhty-dUeTdo7HwPe31m1xDbU=hQVjA@mail.gmail.com>
Subject: Behavior of wakeup_events being 0 in perf_event_open(2)
To: alx+linux-man@kernel.org
Cc: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I was experimenting with perf_event_open(2) and caught this sentence in the
man page.

    Prior to Linux 3.0, setting wakeup_events to 0 resulted in no overflow
    notifications; more recent kernels treat 0 the same as 1.

I wrote a small test program (below) to test this behavior. On
kernel 7.1.13-200.fc44.x86_64, my experience seems to contradict the man page;
it seems that when wakeup_events is 0, it actually notifies the file descriptor
when the ring buffer is half filled (4096 byte size buffer here, (4096 bytes /
2) / (8 bytes per event) = 256 events). Setting this to 1 sends a notification
after every event.

My (rough) reading of the source code supports this understanding:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/events/ring_buffer.c?id=7475ea8b58616b33c04afb976cf0fbaad9dd63fb#n322

Is this a stale entry in the man page, or is my understanding of this facility
incorrect? If it is indeed stale, perhaps this could read

  Prior to Linux 3.0, setting wakeup_events to 0 resulted in no overflow
  notifications; more recent kernels generate notifications based on a default
  watermark of half the ring buffer size.

Test run of program:
    $ gcc main.c
    $ ./a.out 0
    wakeup_events = 0
    wakeup 1: 257 samples of 8 bytes
    wakeup 2: 256 samples of 8 bytes
    wakeup 3: 256 samples of 8 bytes
    wakeup 4: 256 samples of 8 bytes
    $ ./a.out 1
    wakeup_events = 1
    wakeup 1: 1 samples of 8 bytes
    wakeup 2: 1 samples of 8 bytes
    wakeup 3: 1 samples of 8 bytes
    wakeup 4: 1 samples of 8 bytes

Program:
    #define _GNU_SOURCE
    #include <linux/perf_event.h>
    #include <poll.h>
    #include <pthread.h>
    #include <stdint.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <sys/ioctl.h>
    #include <sys/mman.h>
    #include <sys/syscall.h>
    #include <unistd.h>

    #define PAGE_SIZE 4096

    static void *workload(void *unused) {
      for (;;) {
      }

      return unused;
    }

    int main(int argc, char **argv) {
      unsigned wakeup_events = argc > 1 ? atoi(argv[1]) : 0;

      pthread_t workload_thread;
      pthread_create(&workload_thread, NULL, workload, NULL);
      // Needs glibc >= 2.42
      pid_t workload_tid = pthread_gettid_np(workload_thread);

      struct perf_event_attr attrs = {.size = sizeof(attrs)};
      attrs.type = PERF_TYPE_SOFTWARE;
      attrs.config = PERF_COUNT_SW_CPU_CLOCK;
      attrs.freq = 1;
      attrs.sample_freq = 49;
      attrs.disabled = 1;
      attrs.exclude_kernel = 1;
      attrs.wakeup_events = wakeup_events;

      int fd = syscall(SYS_perf_event_open, &attrs, workload_tid, -1, -1, 0);
      if (fd < 0) {
        perror("perf_event_open");
        return 1;
      }

      void *buffer =
          mmap(NULL, PAGE_SIZE * 2, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
      if (buffer == MAP_FAILED) {
        perror("mmap");
        return 1;
      }

      struct perf_event_mmap_page *meta = buffer;
      char *data = (char *)buffer + meta->data_offset;

      ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
      printf("wakeup_events = %u\n", wakeup_events);

      for (int i = 1; i <= 4; i++) {
        struct pollfd poll_fd = {.fd = fd, .events = POLLIN};
        poll(&poll_fd, 1, -1);

        uint64_t head = __atomic_load_n(&meta->data_head, __ATOMIC_ACQUIRE);
        uint64_t tail = meta->data_tail;
        int sample_count = 0;
        int sample_size = 0;

        while (tail < head) {
          struct perf_event_header *header =
              (struct perf_event_header *)(data + tail % meta->data_size);

          if (header->type == PERF_RECORD_SAMPLE) {
            sample_count++;
            sample_size = header->size;
          }

          tail += header->size;
        }
        __atomic_store_n(&meta->data_tail, tail, __ATOMIC_RELEASE);

        printf(
          "wakeup %d: %d samples of %d bytes\n",
          i, sample_count, sample_size
        );
      }

      return 0;
    }




-Nick Krichevsky
