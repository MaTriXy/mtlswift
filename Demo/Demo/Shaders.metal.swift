
// This file is autogenerated, do not edit it
import Alloy


internal class Saturation {

  internal let deviceSupportsNonuniformThreadgroups: Bool

  internal let pipelineState: MTLComputePipelineState

  internal init(library: MTLLibrary, shouldKeepAlpha: Bool) throws {
    let constantValues = MTLFunctionConstantValues()
    self.deviceSupportsNonuniformThreadgroups = library.device.supports(feature: .nonUniformThreadgroups)
    constantValues.set(self.deviceSupportsNonuniformThreadgroups, at: 0)
    constantValues.set(shouldKeepAlpha, at: 1)
    self.pipelineState = try library.computePipelineState(function: "saturation", constants: constantValues)
  }

  internal func callAsFunction(input: MTLTexture, output: MTLTexture, effect: Float, in commandBuffer: MTLCommandBuffer) {
    self.encode(input: input, output: output, effect: effect, in: commandBuffer)
  }
  internal func callAsFunction(input: MTLTexture, output: MTLTexture, effect: Float, using encoder: MTLComputeCommandEncoder) {
    self.encode(input: input, output: output, effect: effect, using: encoder)
  }
  internal func encode(input: MTLTexture, output: MTLTexture, effect: Float, in commandBuffer: MTLCommandBuffer) {
    commandBuffer.compute { encoder in
      encoder.label = "Saturation"
      self.encode(input: input, output: output, effect: effect, using: encoder)
    }
  }
  internal func encode(input: MTLTexture, output: MTLTexture, effect: Float, using encoder: MTLComputeCommandEncoder) {
    let _threadgroupSize = self.pipelineState.max2dThreadgroupSize
    encoder.setTexture(input, index: 0)
    encoder.setTexture(output, index: 1)
    encoder.setValue(effect, at: 0)

    if self.deviceSupportsNonuniformThreadgroups { encoder.dispatch2d(state: self.pipelineState, exactly: output.size, threadgroupSize: _threadgroupSize) } else { encoder.dispatch2d(state: self.pipelineState, covering: output.size, threadgroupSize: _threadgroupSize) }
  }

}


internal class Contrast {

  internal let deviceSupportsNonuniformThreadgroups: Bool

  internal let pipelineState: MTLComputePipelineState

  internal init(library: MTLLibrary, shouldKeepAlpha: Bool) throws {
    let constantValues = MTLFunctionConstantValues()
    self.deviceSupportsNonuniformThreadgroups = library.device.supports(feature: .nonUniformThreadgroups)
    constantValues.set(self.deviceSupportsNonuniformThreadgroups, at: 0)
    constantValues.set(shouldKeepAlpha, at: 1)
    self.pipelineState = try library.computePipelineState(function: "contrast", constants: constantValues)
  }

  internal func callAsFunction(input: MTLTexture, output: MTLTexture, effect: Float, in commandBuffer: MTLCommandBuffer) {
    self.encode(input: input, output: output, effect: effect, in: commandBuffer)
  }
  internal func callAsFunction(input: MTLTexture, output: MTLTexture, effect: Float, using encoder: MTLComputeCommandEncoder) {
    self.encode(input: input, output: output, effect: effect, using: encoder)
  }
  internal func encode(input: MTLTexture, output: MTLTexture, effect: Float, in commandBuffer: MTLCommandBuffer) {
    commandBuffer.compute { encoder in
      encoder.label = "Contrast"
      self.encode(input: input, output: output, effect: effect, using: encoder)
    }
  }
  internal func encode(input: MTLTexture, output: MTLTexture, effect: Float, using encoder: MTLComputeCommandEncoder) {
    let _threadgroupSize = self.pipelineState.max2dThreadgroupSize
    encoder.setTexture(input, index: 0)
    encoder.setTexture(output, index: 1)
    encoder.setValue(effect, at: 0)

    if self.deviceSupportsNonuniformThreadgroups { encoder.dispatch2d(state: self.pipelineState, exactly: output.size, threadgroupSize: _threadgroupSize) } else { encoder.dispatch2d(state: self.pipelineState, covering: output.size, threadgroupSize: _threadgroupSize) }
  }

}


internal class Sharpening {

  internal let deviceSupportsNonuniformThreadgroups: Bool

  internal let pipelineState: MTLComputePipelineState

  internal init(library: MTLLibrary, shouldKeepAlpha: Bool, intensity: Float) throws {
    let constantValues = MTLFunctionConstantValues()
    self.deviceSupportsNonuniformThreadgroups = library.device.supports(feature: .nonUniformThreadgroups)
    constantValues.set(self.deviceSupportsNonuniformThreadgroups, at: 0)
    constantValues.set(shouldKeepAlpha, at: 1)
    constantValues.set(intensity, at: 2)
    self.pipelineState = try library.computePipelineState(function: "sharpen", constants: constantValues)
  }

  internal func callAsFunction(input: MTLTexture, blurred: MTLTexture, output: MTLTexture, in commandBuffer: MTLCommandBuffer) {
    self.encode(input: input, blurred: blurred, output: output, in: commandBuffer)
  }
  internal func callAsFunction(input: MTLTexture, blurred: MTLTexture, output: MTLTexture, using encoder: MTLComputeCommandEncoder) {
    self.encode(input: input, blurred: blurred, output: output, using: encoder)
  }
  internal func encode(input: MTLTexture, blurred: MTLTexture, output: MTLTexture, in commandBuffer: MTLCommandBuffer) {
    commandBuffer.compute { encoder in
      encoder.label = "Sharpening"
      self.encode(input: input, blurred: blurred, output: output, using: encoder)
    }
  }
  internal func encode(input: MTLTexture, blurred: MTLTexture, output: MTLTexture, using encoder: MTLComputeCommandEncoder) {
    let _threadgroupSize = self.pipelineState.max2dThreadgroupSize
    encoder.setTexture(input, index: 0)
    encoder.setTexture(blurred, index: 1)
    encoder.setTexture(output, index: 2)

    if self.deviceSupportsNonuniformThreadgroups { encoder.dispatch2d(state: self.pipelineState, exactly: output.size, threadgroupSize: _threadgroupSize) } else { encoder.dispatch2d(state: self.pipelineState, covering: output.size, threadgroupSize: _threadgroupSize) }
  }

}

