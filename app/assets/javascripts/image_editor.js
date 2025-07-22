// 이미지 편집기 파일 업로드 기능

// 파일 업로드 처리
function handleImageUpload(event) {
  const files = event.target.files;
  if (files.length > 0) {
    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      if (file.type.startsWith('image/')) {
        loadImageFile(file);
      } else {
        alert('이미지 파일만 업로드 가능합니다.');
      }
    }
  }
}

// 이미지 파일 로드
function loadImageFile(file) {
  const reader = new FileReader();
  
  reader.onload = function(e) {
    const imageUrl = e.target.result;
    
    // 업로드된 이미지를 배열에 저장
    uploadedImages.push({
      name: file.name,
      url: imageUrl,
      size: file.size
    });
    
    // 미리보기 업데이트
    updateImagePreview();
    
    // 캔버스에 이미지 추가
    addImageToCanvas(imageUrl, file.name);
  };
  
  reader.readAsDataURL(file);
}

// 캔버스에 이미지 추가
function addImageToCanvas(imageUrl, fileName) {
  if (!canvas) return;
  
  fabric.Image.fromURL(imageUrl, function(img) {
    // 이미지 크기 조정 (캔버스 크기에 맞게)
    const canvasWidth = canvas.getWidth();
    const canvasHeight = canvas.getHeight();
    const imgWidth = img.width;
    const imgHeight = img.height;
    
    // 이미지가 캔버스보다 크면 크기 조정
    let scale = 1;
    if (imgWidth > canvasWidth || imgHeight > canvasHeight) {
      scale = Math.min(canvasWidth / imgWidth, canvasHeight / imgHeight) * 0.8;
    }
    
    img.set({
      left: Math.random() * (canvasWidth - imgWidth * scale),
      top: Math.random() * (canvasHeight - imgHeight * scale),
      scaleX: scale,
      scaleY: scale,
      selectable: true
    });
    
    canvas.add(img);
    canvas.setActiveObject(img);
    canvas.renderAll();
  });
}

// 이미지 미리보기 업데이트
function updateImagePreview() {
  const previewContainer = document.getElementById('uploaded-images');
  previewContainer.innerHTML = '';
  
  uploadedImages.forEach((image, index) => {
    const previewItem = document.createElement('div');
    previewItem.className = 'flex items-center space-x-2 p-2 bg-white rounded border hover:bg-gray-50';
    
    previewItem.innerHTML = `
      <img src="${image.url}" alt="${image.name}" class="w-8 h-8 object-cover rounded">
      <div class="flex-1 min-w-0">
        <p class="text-xs font-medium text-gray-900 truncate">${image.name}</p>
        <p class="text-xs text-gray-500">${formatFileSize(image.size)}</p>
      </div>
      <button onclick="addImageToCanvas('${image.url}', '${image.name}')" 
              class="text-blue-600 hover:text-blue-800 text-xs">
        추가
      </button>
      <button onclick="removeUploadedImage(${index})" 
              class="text-red-600 hover:text-red-800 text-xs">
        삭제
      </button>
    `;
    
    previewContainer.appendChild(previewItem);
  });
}

// 업로드된 이미지 제거
function removeUploadedImage(index) {
  uploadedImages.splice(index, 1);
  updateImagePreview();
}

// 파일 크기 포맷팅
function formatFileSize(bytes) {
  if (bytes === 0) return '0 Bytes';
  const k = 1024;
  const sizes = ['Bytes', 'KB', 'MB', 'GB'];
  const i = Math.floor(Math.log(bytes) / Math.log(k));
  return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
}

// 드래그 앤 드롭 기능 초기화
function initializeDragAndDrop() {
  const dropZone = document.getElementById('drop-zone');
  
  if (!dropZone) return;
  
  // 드래그 오버 이벤트
  dropZone.addEventListener('dragover', function(e) {
    e.preventDefault();
    dropZone.classList.add('border-blue-400', 'bg-blue-50');
    dropZone.textContent = '파일을 놓으세요';
  });
  
  // 드래그 리브 이벤트
  dropZone.addEventListener('dragleave', function(e) {
    e.preventDefault();
    dropZone.classList.remove('border-blue-400', 'bg-blue-50');
    dropZone.textContent = '또는 여기에 파일을 드래그하세요';
  });
  
  // 드롭 이벤트
  dropZone.addEventListener('drop', function(e) {
    e.preventDefault();
    dropZone.classList.remove('border-blue-400', 'bg-blue-50');
    dropZone.textContent = '또는 여기에 파일을 드래그하세요';
    
    const files = e.dataTransfer.files;
    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      if (file.type.startsWith('image/')) {
        loadImageFile(file);
      }
    }
  });
}

// 이미지 편집기 열기 시 드래그 앤 드롭 초기화
function openImageEditor(title, imageUrl) {
  document.getElementById('imageEditorModal').classList.remove('hidden');
  document.getElementById('imageEditorModal').classList.add('flex');
  document.getElementById('editor-title').textContent = `${title} - 이미지 편집기`;
  
  // 업로드된 이미지 배열 초기화
  uploadedImages = [];
  updateImagePreview();
  
  // Fabric.js 캔버스 초기화
  initializeCanvas(imageUrl);
  
  // 드래그 앤 드롭 초기화
  setTimeout(() => {
    initializeDragAndDrop();
  }, 100);
}

// 여러 이미지를 한번에 캔버스에 추가
function addAllImagesToCanvas() {
  uploadedImages.forEach(image => {
    addImageToCanvas(image.url, image.name);
  });
}

// 이미지 레이어 관리
function bringToFront() {
  const activeObject = canvas.getActiveObject();
  if (activeObject) {
    canvas.bringToFront(activeObject);
    canvas.renderAll();
  }
}

function sendToBack() {
  const activeObject = canvas.getActiveObject();
  if (activeObject) {
    canvas.sendToBack(activeObject);
    canvas.renderAll();
  }
}

// 이미지 복제
function duplicateImage() {
  const activeObject = canvas.getActiveObject();
  if (activeObject) {
    activeObject.clone(function(cloned) {
      cloned.set({
        left: cloned.left + 10,
        top: cloned.top + 10
      });
      canvas.add(cloned);
      canvas.setActiveObject(cloned);
      canvas.renderAll();
    });
  }
}

// 이미지 회전
function rotateImage(angle) {
  const activeObject = canvas.getActiveObject();
  if (activeObject) {
    activeObject.rotate(activeObject.angle + angle);
    canvas.renderAll();
  }
}

// 이미지 뒤집기
function flipImage(direction) {
  const activeObject = canvas.getActiveObject();
  if (activeObject) {
    if (direction === 'horizontal') {
      activeObject.set('flipX', !activeObject.flipX);
    } else if (direction === 'vertical') {
      activeObject.set('flipY', !activeObject.flipY);
    }
    canvas.renderAll();
  }
}