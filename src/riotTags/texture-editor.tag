texture-editor.panel.view
    .column.borderright.tall.column1.flexfix
        .flexfix-body
            b {voc.name}
            br
            input.wide(type="text" value="{opts.texture.name}" onchange="{wire('this.texture.name')}")
            .anErrorNotice(if="{nameTaken}") {vocGlob.nametaken}
            br
            b {voc.center}
            .flexrow
                input.short(type="number" value="{opts.texture.axis[0]}" onchange="{wire('this.texture.axis.0')}" oninput="{wire('this.texture.axis.0')}")
                span.center   ×
                input.short(type="number" value="{opts.texture.axis[1]}" onchange="{wire('this.texture.axis.1')}" oninput="{wire('this.texture.axis.1')}")
            br
            .flexrow
                button.wide(onclick="{textureCenter}")
                    span   {voc.setcenter}
                button.square(onclick="{textureIsometrify}" title="{voc.isometrify}")
                    i.icon-map-pin
            br
            b {voc.form}
            br
            label
                input(type="radio" name="collisionform" checked="{opts.texture.shape === 'circle'}" onclick="{textureSelectCircle}")
                span {voc.round}
            br
            label
                input(type="radio" name="collisionform" checked="{opts.texture.shape === 'rect'}" onclick="{textureSelectRect}")
                span {voc.rectangle}
            br
            label
                input(type="radio" name="collisionform" checked="{opts.texture.shape === 'strip'}" onclick="{textureSelectStrip}")
                span {voc.strip}
            br
            div(if="{opts.texture.shape === 'circle'}")
                b {voc.radius}
                br
                input.wide(type="number" value="{opts.texture.r}" onchange="{wire('this.texture.r')}" oninput="{wire('this.texture.r')}")
            div(if="{opts.texture.shape === 'rect'}")
                .center
                    input.short(type="number" value="{opts.texture.top}" onchange="{wire('this.texture.top')}" oninput="{wire('this.texture.top')}")
                    br
                    input.short(type="number" value="{opts.texture.left}" onchange="{wire('this.texture.left')}" oninput="{wire('this.texture.left')}")
                    span   ×
                    input.short(type="number" value="{opts.texture.right}" onchange="{wire('this.texture.right')}" oninput="{wire('this.texture.right')}")
                    br
                    input.short(type="number" value="{opts.texture.bottom}" onchange="{wire('this.texture.bottom')}" oninput="{wire('this.texture.bottom')}")
                br
                button.wide(onclick="{textureFillRect}")
                    i.icon-maximize
                    span {voc.fill}
            div(if="{opts.texture.shape === 'strip'}")
                .flexrow(each="{point, ind in opts.texture.stripPoints}")
                    input.short(type="number" value="{point.x}" oninput="{wire('this.texture.stripPoints.'+ ind + '.x')}")
                    span   ×
                    input.short(type="number" value="{point.y}" oninput="{wire('this.texture.stripPoints.'+ ind + '.y')}")
                    button.square.inline(title="{voc.removePoint}" onclick="{removeStripPoint}")
                        i.icon-minus
                input(type="checkbox" checked="{opts.texture.closedStrip}")
                span   {voc.closeShape}
                button.wide(onclick="{addStripPoint}")
                    i.icon-plus
                    span   {voc.addPoint}
            br
            label
                input(checked="{prevShowMask}" onchange="{wire('this.prevShowMask')}" type="checkbox")
                span   {voc.showmask}
        .flexfix-footer
            button.wide(onclick="{textureSave}")
                i.icon-save
                span {window.languageJSON.common.save}
    .column.column2.borderleft.tall.flexfix
        .flexfix-body
            .fifty.np
                b {voc.cols}
                br
                input.wide(type="number" value="{opts.texture.grid[0]}" onchange="{wire('this.texture.grid.0')}" oninput="{wire('this.texture.grid.0')}")
            .fifty.np
                b {voc.rows}
                br
                input.wide(type="number" value="{opts.texture.grid[1]}" onchange="{wire('this.texture.grid.1')}" oninput="{wire('this.texture.grid.1')}")
            .clear
            .fifty.np
                b {voc.width}
                br
                input.wide(type="number" value="{opts.texture.width}" onchange="{wire('this.texture.width')}" oninput="{wire('this.texture.width')}")
            .fifty.np
                b {voc.height}
                br
                input.wide(type="number" value="{opts.texture.height}" onchange="{wire('this.texture.height')}" oninput="{wire('this.texture.height')}")
            .clear
            .fifty.np
                b {voc.marginx}
                br
                input.wide(type="number" value="{opts.texture.marginx}" onchange="{wire('this.texture.marginx')}" oninput="{wire('this.texture.marginx')}")
            .fifty.np
                b {voc.marginy}
                br
                input.wide(type="number" value="{opts.texture.marginy}" onchange="{wire('this.texture.marginy')}" oninput="{wire('this.texture.marginy')}")
            .clear
            .fifty.np
                b {voc.offx}
                br
                input.wide(type="number" value="{opts.texture.offx}" onchange="{wire('this.texture.offx')}" oninput="{wire('this.texture.offx')}")
            .fifty.np
                b {voc.offy}
                br
                input.wide(type="number" value="{opts.texture.offy}" onchange="{wire('this.texture.offy')}" oninput="{wire('this.texture.offy')}")
            .clear
            b {voc.frames}
            br
            input#textureframes.wide(type="number" value="{opts.texture.untill}" onchange="{wire('this.texture.untill')}" oninput="{wire('this.texture.untill')}")
            br
            label
                input#texturetiled(type="checkbox" checked="{opts.texture.tiled}" onchange="{wire('this.texture.tiled')}")
                span   {voc.tiled}
        .preview.bordertop.flexfix-footer
            #preview(ref="preview" style="background-color: {previewColor};")
                canvas(ref="grprCanvas")
            div
                button#textureplay.square.inline(onclick="{currentTexturePreviewPlay}")
                    i(class="icon-{this.prevPlaying? 'pause' : 'play'}")
                button#textureviewback.square.inline(onclick="{currentTexturePreviewBack}")
                    i.icon-back
                button#textureviewnext.square.inline(onclick="{currentTexturePreviewNext}")
                    i.icon-next
                span(ref="textureviewframe") 0 / 1
                br
                b {voc.speed}
                input#grahpspeed.short(type="number" min="1" value="{prevSpeed}" onchange="{wire('this.prevSpeed')}" oninput="{wire('this.prevSpeed')}")
            .relative
                button#texturecolor.inline.wide(onclick="{changeTexturePreviewColor}")
                    i.icon-drop
                    span {voc.bgcolor}
            input.color.rgb#previewbgcolor

    color-picker(
        ref="previewBackgroundColor" if="{changingTexturePreviewColor}"
        color="{previewColor}" onapply="{updatePreviewColor}" onchanged="{updatePreviewColor}" oncancel="{cancelPreviewColor}"
    )
    .texture-editor-anAtlas(style="background-color: {previewColor};")
        .textureview-tools
            .toright
                label.file(title="{voc.replacetexture}")
                    input(type="file" ref="textureReplacer" accept=".png,.jpg,.jpeg,.bmp,.gif" onchange="{textureReplace}")
                    .button.inline
                        i.icon-folder
                        span {voc.replacetexture}
                .button.inline(title="{voc.reimport}" if="{opts.texture.source}" onclick="{reimport}")
                    i.icon-refresh-ccw
        .textureview-zoom
            div.button-stack.inlineblock
                button#texturezoom25.inline(onclick="{textureToggleZoom(0.25)}" class="{active: zoomFactor === 0.25}") 25%
                button#texturezoom50.inline(onclick="{textureToggleZoom(0.5)}" class="{active: zoomFactor === 0.5}") 50%
                button#texturezoom100.inline(onclick="{textureToggleZoom(1)}" class="{active: zoomFactor === 1}") 100%
                button#texturezoom200.inline(onclick="{textureToggleZoom(2)}" class="{active: zoomFactor === 2}") 200%
                button#texturezoom400.inline(onclick="{textureToggleZoom(4)}" class="{active: zoomFactor === 4}") 400%

        canvas(ref="textureCanvas" onmousewheel="{onCanvasWheel}" style="transform: scale({zoomFactor}); image-rendering: {zoomFactor > 1? 'pixelated' : '-webkit-optimize-contrast'}; transform-origin: 0% 0%;")
        .aDragger(
            style="left: {opts.texture.axis[0] * zoomFactor}px; top: {opts.texture.axis[1] * zoomFactor}px;"
            title="{voc.moveCenter}"
            onmousedown="{startMoving('axis')}"
        )
        .aDragger(
            if="{opts.texture.shape === 'strip'}"
            each="{point, ind in opts.texture.stripPoints}"
            style="left: {(point.x + texture.axis[0]) * zoomFactor}px; top: {(point.y + texture.axis[1]) * zoomFactor}px;"
            title="{voc.movePoint}"
            onmousedown="{startMoving('point')}"
        )
    script.
        const path = require('path'),
              fs = require('fs-extra');
        const glob = require('./data/node_requires/glob');
        this.namespace = 'textureview';
        this.mixin(window.riotVoc);
        this.mixin(window.riotWired);

        this.nameTaken = false;
        this.prevPlaying = true;
        this.prevPos = 0;
        this.prevSpeed = 10;
        this.prevShowMask = true;
        this.previewColor = localStorage.UItheme === 'Day'? '#ffffff' : '#08080D';
        this.zoomFactor = 1;

        var textureCanvas, grprCanvas;

        this.on('mount', () => {
            textureCanvas = this.refs.textureCanvas;
            grprCanvas = this.refs.grprCanvas;
            textureCanvas.x = textureCanvas.getContext('2d');
            grprCanvas.x = grprCanvas.getContext('2d');
            var texture = this.texture = this.opts.texture;
            var img = document.createElement('img');
            img.onload = () => {
                textureCanvas.img = img;
                this.update();
                setTimeout(() => {
                    this.launchTexturePreview();
                }, 0);
            };
            img.onerror = e => {
                alertify.error(languageJSON.textureview.corrupted);
                console.error(e);
                this.textureSave();
            };
            img.src = path.join('file://', sessionStorage.projdir, '/img/', texture.origname) + '?' + Math.random();
        });
        this.on('update', () => {
            if (window.currentProject.textures.find(texture =>
                this.texture.name === texture.name && this.texture !== texture
            )) {
                this.nameTaken = true;
            } else {
                this.nameTaken = false;
            }
        });
        this.on('updated', () => {
            this.refreshTextureCanvas();
        });
        this.on('unmount', () => {
            if (this.prevPlaying) { // вырубаем анимацию превью, если редактор был закрыт
                this.stopTexturePreview();
            }
        });

        this.textureReplace = e => {
            if (/\.(jpg|gif|png|jpeg)/gi.test(this.refs.textureReplacer.value)) {
                this.loadImg(
                    this.texture.uid,
                    this.refs.textureReplacer.value,
                    sessionStorage.projdir + '/img/i' + this.texture.uid + path.extname(this.refs.textureReplacer.value)
                );
                this.texture.source = this.refs.textureReplacer.value;
            } else {
                alertify.error(window.languageJSON.common.wrongFormat);
                console.log(this.refs.textureReplacer.value, 'NOT passed');
            }
            this.refs.textureReplacer.value = '';
        };
        this.reimport = e => {
            this.loadImg(
                this.texture.uid,
                this.texture.source,
                sessionStorage.projdir + '/img/i' + this.texture.uid + path.extname(this.refs.textureReplacer.value)
            );
        }

        /**
         * Загружает изображение в редактор и генерирует квадратную превьюху из исходного изображения
         * @param {Number} uid Идентификатор изображения
         * @param {String} filename Путь к исходному изображению
         * @param {Sting} dest Путь к изображению в папке проекта
         */
        this.loadImg = (uid, filename, dest) => {
            fs.copy(filename, dest, e => {
                if (e) throw e;
                image = document.createElement('img');
                image.onload = () => {
                    this.texture.imgWidth = image.width;
                    this.texture.imgHeight = image.height;
                    this.texture.origname = path.basename(dest);
                    textureCanvas.img = image;
                    this.texture.lastmod = +(new Date());
                    this.parent.imgGenPreview(dest, dest + '_prev.png', 64, () => {
                        this.update();
                    });
                    this.parent.imgGenPreview(dest, dest + '_prev@2.png', 128, () => {

                    });
                    setTimeout(() => {
                        this.refreshTextureCanvas();
                        this.parent.fillTextureMap();
                        this.launchTexturePreview();
                    }, 0);
                };
                image.onerror = e => {
                    alertify.error(e);
                };
                image.src = 'file://' + dest + '?' + Math.random();
            });
        };

        this.textureToggleZoom = zoom => e => {
            this.zoomFactor = zoom;
        };
        /** Change zoomFactor on mouse wheel roll */
        this.onCanvasWheel = e => {
            if (e.wheelDelta > 0) {
                // in
                if (this.zoomFactor === 2) {
                    this.zoomFactor = 4;
                } else if (this.zoomFactor === 1) {
                    this.zoomFactor = 2;
                } else if (this.zoomFactor === 0.5) {
                    this.zoomFactor = 1;
                } else if (this.zoomFactor === 0.25) {
                    this.zoomFactor = 0.5;
                }
            } else {
                // out
                if (this.zoomFactor === 4) {
                    this.zoomFactor = 2;
                } else if (this.zoomFactor === 2) {
                    this.zoomFactor = 1;
                } else if (this.zoomFactor === 1) {
                    this.zoomFactor = 0.5;
                } else if (this.zoomFactor === 0.5) {
                    this.zoomFactor = 0.25;
                }
            }
            this.update();
        };

        /**
         * Установить ось вращения на центр изображения
         */
        this.textureCenter = e => {
            var texture = this.texture;
            texture.axis[0] = Math.floor(texture.width / 2);
            texture.axis[1] = Math.floor(texture.height / 2);
        };
        /**
         * Заполнить всё изображение маской-квадратом
         */
        this.textureFillRect = e => {
            var texture = this.texture;
            texture.left = ~~(texture.axis[0]);
            texture.top = ~~(texture.axis[1]);
            texture.right = ~~(texture.width - texture.axis[0]);
            texture.bottom = ~~(texture.height - texture.axis[1]);
        };
        this.textureIsometrify = e => {
            var texture = this.texture;
            texture.axis[0] = Math.floor(texture.width / 2);
            texture.axis[1] = texture.height;
            this.textureFillRect();
        };
        /**
         * Запустить предпросмотр анимации
         */
        this.currentTexturePreviewPlay = e => {
            if (this.prevPlaying) {
                this.stopTexturePreview();
            } else {
                this.launchTexturePreview();
            }
            this.prevPlaying = !this.prevPlaying;
        };
        /**
         * Отступить на шаг назад в предпросмотре анимации
         */
        this.currentTexturePreviewBack = e => {
            this.prevPos--;
            var texture = this.texture;
            var total = texture.untill === 0? texture.grid[0] * texture.grid[1] : Math.min(texture.grid[0] * texture.grid[1], texture.untill);
            if (this.prevPos < 0) {
                this.prevPos = texture.untill === 0 ? texture.grid[0] * texture.grid[1] : total - 0;
            }
            this.refreshPreviewCanvas();
        };
        /**
         * Шагнуть на кадр вперёд в предпросмотре анимации
         */
        this.currentTexturePreviewNext = e => {
            this.prevPos++;
            var texture = this.texture;
            var total = texture.untill === 0? texture.grid[0] * texture.grid[1] : Math.min(texture.grid[0] * texture.grid[1], texture.untill);
            if (this.prevPos >= total) {
                this.prevPos = 0;
            }
            this.refreshPreviewCanvas();
        };
        this.refreshPreviewCanvas = () => {
            let xx = this.prevPos % this.texture.grid[0],
                yy = Math.floor(this.prevPos / this.texture.grid[0]),
                x = this.texture.offx + xx * (this.texture.marginx + this.texture.width),
                y = this.texture.offy + yy * (this.texture.marginy + this.texture.height),
                w = this.texture.width,
                h = this.texture.height;
            grprCanvas.width = w;
            grprCanvas.height = h;

            grprCanvas.x.clearRect(0, 0, grprCanvas.width, grprCanvas.height);
            grprCanvas.x.drawImage(
                textureCanvas.img,
                x, y, w, h,
                0, 0, w, h
            );
            // shape
            if (this.prevShowMask) {
                grprCanvas.x.globalAlpha = 0.5;
                grprCanvas.x.fillStyle = '#ff0';
                if (this.texture.shape == 'rect') {
                    grprCanvas.x.fillRect(
                        this.texture.axis[0] - this.texture.left,
                        this.texture.axis[1] - this.texture.top,
                        this.texture.right + this.texture.left,
                        this.texture.bottom + this.texture.top
                    );
                } else if (this.texture.shape === 'circle') {
                    grprCanvas.x.beginPath();
                    grprCanvas.x.arc(this.texture.axis[0], this.texture.axis[1], this.texture.r, 0, 2 * Math.PI);
                    grprCanvas.x.fill();
                } else if (this.texture.shape === 'strip' && this.texture.stripPoints.length) {
                    grprCanvas.x.strokeStyle = '#ff0';
                    grprCanvas.x.lineWidth = 3;
                    grprCanvas.x.beginPath();
                    grprCanvas.x.moveTo(this.texture.stripPoints[0].x + this.texture.axis[0], this.texture.stripPoints[0].y + this.texture.axis[1]);
                    for (let i = 1, l = this.texture.stripPoints.length; i < l; i++) {
                        grprCanvas.x.lineTo(this.texture.stripPoints[i].x + this.texture.axis[0], this.texture.stripPoints[i].y + this.texture.axis[1]);
                    }
                    if (this.texture.closedStrip) {
                        grprCanvas.x.closePath();
                    }
                    grprCanvas.x.stroke();
                }
                grprCanvas.x.globalAlpha = 1;
                grprCanvas.x.fillStyle = '#f33';
                grprCanvas.x.beginPath();
                grprCanvas.x.arc(this.texture.axis[0], this.texture.axis[1], 3, 0, 2 * Math.PI);
                grprCanvas.x.fill();
            }
        };
        /**
         * Остановить предпросмотр анимации
         */
        this.stopTexturePreview = () => {
            window.clearTimeout(this.prevTime);
        };
        /**
         * Запустить предпросмотр анимации
         */
        this.launchTexturePreview = () => {
            var texture = this.texture;
            if (this.prevTime) {
                window.clearTimeout(this.prevTime);
            }
            this.prevPos = 0;
            this.stepTexturePreview();
        };
        /**
         * Шаг анимации в предпросмотре. Выполняет рендер. Записывает таймер следующего шага в this.prevTime
         */
        this.stepTexturePreview = () => {
            var texture = this.texture;
            this.prevTime = window.setTimeout(() => {
                var total = Math.min(texture.untill === 0 ? Infinity : texture.untill, texture.grid[0] * texture.grid[1]);
                this.prevPos++;
                if (this.prevPos >= total) {
                    this.prevPos = 0;
                }
                this.refs.textureviewframe.innerHTML = `${this.prevPos} / ${total}`;
                this.refreshPreviewCanvas();
                this.stepTexturePreview();
            }, ~~(1000 / this.prevSpeed));
        };

        /**
         * Переключает тип маски на круг и выставляет начальные параметры
         */
        this.textureSelectCircle = function() {
            this.texture.shape = 'circle';
            if (!('r' in this.texture) || this.texture.r === 0) {
                this.texture.r = Math.min(
                    Math.floor(this.texture.width / 2),
                    Math.floor(this.texture.height / 2)
                );
            }
        };
        /**
         * Переключает тип маски на прямоугольник и выставляет начальные параметры
         */
        this.textureSelectRect = function() {
            this.texture.shape = 'rect';
            this.textureFillRect();
        };
        /**
         * Переключает тип маски на ломаную/многоугольник и выставляет начальные параметры
         */
        this.textureSelectStrip = function () {
            this.texture.shape = 'strip';
            this.texture.stripPoints = this.texture.stripPoints || [];
            if (!this.texture.stripPoints.length) {
                const twoPi = Math.PI * 2;
                this.texture.closedStrip = true;
                for (let i = 0; i < 5; i++) {
                    this.texture.stripPoints.push({
                        x: Math.round(Math.sin(twoPi / 5 * i) * this.texture.width / 2),
                        y: -Math.round(Math.cos(twoPi / 5 * i) * this.texture.height / 2)
                    });
                }
                console.log(this.texture);
            }
        };
        this.removeStripPoint = function (e) {
            this.texture.stripPoints.splice(e.item.ind, 1);
        };
        this.addStripPoint = function () {
            this.texture.stripPoints.push({
                x: 0,
                y: 16
            });
        };
        this.startMoving = which => e => {
            const startX = e.screenX,
                  startY = e.screenY;
            if (which === 'axis') {
                const oldX = this.texture.axis[0],
                      oldY = this.texture.axis[1];
                const func = e => {
                    this.texture.axis[0] = (e.screenX - startX) / this.zoomFactor + oldX;
                    this.texture.axis[1] = (e.screenY - startY) / this.zoomFactor + oldY;
                    this.update();
                }, func2 = () => {
                    document.removeEventListener('mousemove', func);
                    document.removeEventListener('mouseup', func2);
                };
                document.addEventListener('mousemove', func);
                document.addEventListener('mouseup', func2);
            } else if (which === 'point') {
                const point = e.item.point,
                      oldX = point.x,
                      oldY = point.y;
                const func = e => {
                    point.x = (e.screenX - startX) / this.zoomFactor + oldX;
                    point.y = (e.screenY - startY) / this.zoomFactor + oldY;
                    this.update();
                }, func2 = () => {
                    document.removeEventListener('mousemove', func);
                    document.removeEventListener('mouseup', func2);
                };
                document.addEventListener('mousemove', func);
                document.addEventListener('mouseup', func2);
            }
        };
        /**
         * Перерисовывает канвас со спрайтом со всеми масками и делениями
         */
        this.refreshTextureCanvas = () => {
            textureCanvas.width = textureCanvas.img.width;
            textureCanvas.height = textureCanvas.img.height;
            textureCanvas.x.strokeStyle = "#0ff";
            textureCanvas.x.lineWidth = 1;
            textureCanvas.x.globalCompositeOperation = 'source-over';
            textureCanvas.x.clearRect(0, 0, textureCanvas.width, textureCanvas.height);
            textureCanvas.x.drawImage(textureCanvas.img, 0, 0);
            textureCanvas.x.globalAlpha = 0.5;
            for (let i = 0, l = Math.min(this.texture.grid[0] * this.texture.grid[1], this.texture.untill || Infinity); i < l; i++) {
                let xx = i % this.texture.grid[0],
                    yy = Math.floor(i / this.texture.grid[0]),
                    x = this.texture.offx + xx * (this.texture.marginx + this.texture.width),
                    y = this.texture.offy + yy * (this.texture.marginy + this.texture.height),
                    w = this.texture.width,
                    h = this.texture.height;
                textureCanvas.x.strokeRect(x, y, w, h);
            }
            if (this.prevShowMask) {
                textureCanvas.x.fillStyle = '#ff0';
                if (this.texture.shape === 'rect') {
                    textureCanvas.x.fillRect(
                        this.texture.axis[0] - this.texture.left,
                        this.texture.axis[1] - this.texture.top,
                        this.texture.right + this.texture.left,
                        this.texture.bottom + this.texture.top
                    );
                } else if (this.texture.shape === 'circle') {
                    textureCanvas.x.beginPath();
                    textureCanvas.x.arc(this.texture.axis[0], this.texture.axis[1], this.texture.r, 0, 2 * Math.PI);
                    textureCanvas.x.fill();
                } else if (this.texture.shape === 'strip' && this.texture.stripPoints.length) {
                    textureCanvas.x.strokeStyle = '#ff0';
                    textureCanvas.x.lineWidth = 3;
                    textureCanvas.x.beginPath();
                    textureCanvas.x.moveTo(this.texture.stripPoints[0].x + this.texture.axis[0], this.texture.stripPoints[0].y + this.texture.axis[1]);
                    for (let i = 1, l = this.texture.stripPoints.length; i < l; i++) {
                        textureCanvas.x.lineTo(this.texture.stripPoints[i].x + this.texture.axis[0], this.texture.stripPoints[i].y + this.texture.axis[1]);
                    }
                    if (this.texture.closedStrip) {
                        textureCanvas.x.closePath();
                    }
                    textureCanvas.x.stroke();
                }
            }
        };

        /**
         * Событие сохранения графики
         */
        this.textureSave = () => {
            this.parent.fillTextureMap();
            glob.modified = true;
            this.texture.lastmod = +(new Date());
            this.textureGenPreview(sessionStorage.projdir + '/img/' + this.texture.origname + '_prev@2.png', 128);
            this.textureGenPreview(sessionStorage.projdir + '/img/' + this.texture.origname + '_prev.png', 64)
            .then(() => {
                this.parent.editing = false;
                this.parent.update();
            });
        };

        /**
         * Генерирует превьюху первого кадра графики
         * @returns {Promise} Промис
         */
        this.textureGenPreview = function(destination, size) {
            return new Promise((accept, decline) => {
                var c = document.createElement('canvas');
                let x = this.texture.offx,
                    y = this.texture.offy,
                    w = this.texture.width,
                    h = this.texture.height;
                c.x = c.getContext('2d');
                c.width = c.height = size;
                c.x.clearRect(0, 0, size, size);
                if (w > h) {
                    k = size / w;
                } else {
                    k = size / h;
                }
                if (k > 1) k = 1;
                c.x.drawImage(textureCanvas.img,
                    x, y, w, h,
                    (size - w*k) / 2, (size - h*k) / 2,
                    w*k, h*k
                );
                var data = c.toDataURL().replace(/^data:image\/\w+;base64,/, '');
                var buf = new Buffer(data, 'base64');
                fs.writeFile(destination, buf, function(err) {
                    if (err) {
                        console.log(err);
                        decline(err);
                    } else {
                        accept(destination);
                    }
                });
            });
        };

        this.changeTexturePreviewColor = e => {
            this.changingTexturePreviewColor = !this.changingTexturePreviewColor;
            if (this.changingTexturePreviewColor) {
                this.oldPreviewColor = this.previewColor;
            }
        };
        this.updatePreviewColor = (color, evtype) => {
            this.previewColor = color;
            if (evtype === 'onapply') {
                this.changingTexturePreviewColor = false;
            }
            this.update();
        };
        this.cancelPreviewColor = () => {
            this.changingTexturePreviewColor = false;
            this.previewColor = this.oldPreviewColor;
            this.update();
        };
